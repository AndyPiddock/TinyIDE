script "button_ToolsWidgets_23591"
global gStackName
on mouseUp
   if the hilite of me is true then
      set the cpToolsWidgets of this stack to "true"
   else
      set the cpToolsWidgets of this stack to "false"
   end if
end mouseUp
