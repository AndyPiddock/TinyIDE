script "button_BtnEditGroupSelected_9348"
on mouseUp
   if the disabled of button "Edit Group" of stack "revMenuBar" is true then
      exit mouseUp
   end if
   
   send "menuPick" && "Edit Group" to button "Object" of stack "revMenuBar"
   if the label of button "Edit Group" of stack "revMenuBar" is "Stop Editing" then
      set the icon of me to 9347
   else
      set the icon of me to 13307
   end if
end mouseUp
