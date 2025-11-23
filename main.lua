require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "androidx.appcompat.widget.LinearLayoutCompat"
import "androidx.appcompat.widget.AppCompatImageButton"
import "android.view.View"
import "android.text.TextWatcher"
import "android.widget.PopupMenu"

activity.setTheme(R.style.Theme_Material3_Blue)
.setTitle("文本编辑器3.0")
.setContentView(loadlayout("layout"))

activity.getSupportActionBar().hide()

local window = activity.getWindow()
window.setStatusBarColor(0xF7F9FE)

-- 定义一个栈来保存文本状态
local textStack = {}
local stackIndex = 0

function exit.onClick()
  activity.finish()
end

function undo.onClick()
  -- 撤销操作：从栈中取出上一个状态
  if stackIndex > 1 then
    stackIndex = stackIndex - 1
    editText.setText(textStack[stackIndex])
  end
end

-- 监听文本变化，保存当前状态
local textWatcher = TextWatcher {
  beforeTextChanged = function(charSequence, start, count, after) end,
  onTextChanged = function(charSequence, start, before, count)
    -- 获取当前文本内容
    local text = charSequence.toString()
    -- 如果当前索引小于栈的大小，先清理后续状态
    if stackIndex < #textStack then
      for i = #textStack, stackIndex + 1, -1 do
        table.remove(textStack, i)
      end
    end
    -- 将当前文本状态压入栈
    table.insert(textStack, text)
    stackIndex = #textStack
  end,
  afterTextChanged = function(editable) end
}

-- 添加文本变化监听器
editText.addTextChangedListener(textWatcher)

-- 弹出菜单的监听器
function more.onClick()
  local popupMenu = PopupMenu(activity, more)
  popupMenu.getMenu().add("复制全文")
  popupMenu.getMenu().add("清空全文")
  popupMenu.getMenu().add("关于")
  popupMenu.setOnMenuItemClickListener {
    onMenuItemClick = function(item)
      if item.getTitle() == "复制全文" then
        -- 复制全文
        editText.setText(editText.getText())
        android.content.ClipData.newPlainText("text", editText.getText().toString()):putToClipboard(activity, "Copied Text")
        Toast.makeText(activity, "全文已复制", Toast.LENGTH_SHORT).show()
      elseif item.getTitle() == "清空全文" then
        -- 清空全文
        editText.setText("")
      elseif item.getTitle() == "关于" then
        -- 关于
        Toast.makeText(activity, "作者没做", Toast.LENGTH_SHORT).show()
      end
      return true
    end,
  }
  popupMenu.show()
end