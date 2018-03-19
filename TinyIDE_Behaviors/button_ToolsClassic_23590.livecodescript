script "button_ToolsClassic_23590"
global gStackName
on mouseUp
   if the hilite of me is true then
      set the cpToolsClassic of this stack to "true"
   else
      set the cpToolsClassic of this stack to "false"
   end if
end mouseUp
