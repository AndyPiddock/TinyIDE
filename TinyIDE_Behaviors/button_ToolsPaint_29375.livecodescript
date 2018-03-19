script "button_ToolsPaint_29375"
global gStackName
on mouseUp
   if the hilite of me is true then
      set the cpToolsPaint of this stack to "true"
   else
      set the cpToolsPaint of this stack to "false"
   end if
end mouseUp
