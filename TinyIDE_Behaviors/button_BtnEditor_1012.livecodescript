script "button_BtnEditor_1012"
on mouseUp
   if the platform is "Win32" then
      launch "C:\Program Files (x86)\Notepad++\notepad++.exe"
   else  if the platform is "MacOS" then
    launch "/Applications/TextEdit.app" 
   else  if the platform is "Linux" then
      get shell ("/usr/bin/gedit")
   end if
end mouseUp
