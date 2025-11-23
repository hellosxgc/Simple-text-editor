require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "androidx.appcompat.widget.LinearLayoutCompat"

import "androidx.appcompat.widget.LinearLayoutCompat"
import "androidx.appcompat.widget.AppCompatImageButton"
import "android.view.View"

activity
.setTheme(R.style.Theme_Material3_Blue)
.setTitle("文本编辑器2.0")
.setContentView(loadlayout("layout"))

activity.getSupportActionBar().hide()

function exit.onClick()
  activity.finish()
end

function more.onClick()
  Toast.makeText(activity, "作者还没做", Toast.LENGTH_SHORT).show()
end

function undo.onClick()
  editText.setText("")
end