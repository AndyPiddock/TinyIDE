script "button_ToolsGraphicToolsControls_31650"
global gStackName
on mouseUp
   if the hilite of me is true then
      set the cpGraphicToolsControls of this stack to "true"
   else
      set the cpGraphicToolsControls of this stack to "false"
   end if
end mouseUp
