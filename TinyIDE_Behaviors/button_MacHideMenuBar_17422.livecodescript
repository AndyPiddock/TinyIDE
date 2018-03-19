script "button_MacHideMenuBar_17422"
global gStackName
on mouseUp
   if the hilite of me is true then
      set the visible of group "revMenuBar" of card "CrdMain" of stack gStackName to "false" 
      set the visible of group "revMenuBar" of card "CrdInfo" of stack gStackName to "false"
      set the cpShowMacMenu of this stack to "true"
   else
      set the visible of group "revMenuBar" of card "CrdMain" of stack gStackName to "true"
      set the visible of group "revMenuBar" of card "CrdInfo" of stack gStackName to "true"
      set the cpShowMacMenu of this stack to "false"
   end if
end mouseUp
