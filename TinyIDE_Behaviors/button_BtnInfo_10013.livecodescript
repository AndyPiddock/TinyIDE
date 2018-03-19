script "button_BtnInfo_10013"
global gStackName --used to set the stack name during debug and editlocal tToolsPath
global gStackYPos -- for recording and reseting top postion 
on mouseUp
   lock screen
   put the top of this stack into gStackYPos
   set the height of this stack to "340"
   set the top of this stack to gStackYPos
   put cr before fld "FldLaunchList" of card "CrdInfo" of stack gStackName
   go card "CrdInfo"
   resizeStack
   unlock screen
end mouseUp
