script "button_BtnGroupSelect_13255"
on mouseUp
   send "mouseUp" to button "Select Grouped" of stack "revMenuBar"
   if the icon of button "Select Grouped" of stack "revMenuBar" is 101046 then
      set the icon of me to 13254
   else
      set the icon of me to 13256
   end if
end mouseUp
