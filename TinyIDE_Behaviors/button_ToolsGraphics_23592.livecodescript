script "button_ToolsGraphics_23592"
global gStackName
on mouseUp
   if the hilite of me is true then
      set the cpToolsGraphics of this stack to "true"
   else
      set the cpToolsGraphics of this stack to "false"
   end if
end mouseUp
