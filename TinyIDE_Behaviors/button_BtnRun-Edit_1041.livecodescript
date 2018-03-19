script "button_BtnRun-Edit_1041"
on mouseUp
   if the icon of me is 8830 then
      --run
      choose "browse"
   else
      --edit
      choose "pointer"
   end if
   updateTool
end mouseUp

on updateTool
   if tool is "browse tool" then
      set the icon of me to 8648
      set the toolTip of me to "Run Mode - click to toggle Edit Mode"
   else
      set the icon of me to 8830
      set the toolTip of me to "Edit Mode - click to toggle Run Mode"
   end if
end updateTool
