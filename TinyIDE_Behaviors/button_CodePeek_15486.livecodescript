script "button_CodePeek_15486"
global gStackName
on mouseUp
   if the hilite of me is true then
      set the cpCodePeek of this stack to "true"
      set the visible of stack "CodePeek" to true
   else
      set the cpCodePeek of this stack to "false"
      set the visible of stack "CodePeek" to false
   end if
   go stack gStackName
end mouseUp
