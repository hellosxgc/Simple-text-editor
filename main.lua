require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "androidx.appcompat.widget.LinearLayoutCompat"
import "androidx.appcompat.widget.LinearLayoutCompat"
import "androidx.appcompat.widget.AppCompatButton"
import "android.widget.Toast"

activity
.setTheme(R.style.Theme_Material3_Green)
.setTitle("文本编辑器")
.setContentView(loadlayout("layout"))

activity.getSupportActionBar().hide()

function more.onClick()
  Toast.makeText(activity, "作者还没做", Toast.LENGTH_SHORT).show()
end

function exit.onClick()
  activity.finish()
end  
  