script "button_ToolsPaintControls_31648"
global gStackName
on mouseUp
   if the hilite of me is true then
      set the cpToolsPaintControls of this stack to "true"
   else
      set the cpToolsPaintControls of this stack to "false"
   end if
end mouseUp
