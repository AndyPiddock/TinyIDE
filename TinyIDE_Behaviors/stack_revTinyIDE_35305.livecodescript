script "stack_revTinyIDE_35305"
-- TinyIDE for LiveCode
-- Author - Andy Piddock
-- Web - 2108.co.uk
-- Add to your Plugins folder and set to auto-start with LiveCode.
-- Credits:
-- Icons - Gentalface Free Wireframe Toolbar Icons for GUI designers
-- http://gentleface.com/free_icon_set.html

global gStackYPos --for recording and reseting top postion

global gStackName --used to set the stack name during debug and editlocal tTooltPath

global gTooltPath --location of TinyIDETools folder
global gToolsFiles --files in the TinyIDETools folder

-- Add delay to allow slower startup times of LC V9
on preOpenStack
   wait 2 seconds with messages
end preOpenStack

on openStack
   put "revTinyIDE" into gStackName --live
   --put "TinyIDE" into gStackName --dev

   --set time default
   put "0.0" into fld "timer" of card "CrdMain" of stack gStackName

   --set revTinyIDE defaults
   put empty into fld "FldStatus" of card "CrdMain" of stack gStackName

   --

   --is mon1 offset set
   set the label of button "Monitor1TOffset" of card "CrdInfo" of stack gStackName  to the cpTopOffsetMon1 of stack gStackName

   --is mon2 offset set
   set the label of button "Monitor2TOffset" of card "CrdInfo" of stack gStackName  to the cpTopOffsetMon2 of stack gStackName

   --is docked offset set
   set the label of button "MonitorDTOffset" of card "CrdInfo" of stack gStackName  to the cpTopOffsetDocked of stack gStackName

   --determine TinyIDE path
   GetStackPath
   --load Web and App lists
   LoadWebApps

   lock screen
   --set the width of me to item 3 of the screenRect -20
   set the visible of stack "revTools" to false
   set the effective top of stack "revMenuBar" to item 2 of the working screenRect
   set the effective left of stack "revMenuBar" to 0
   local tMenuBarVisible
   put the visible of stack "revMenuBar" into tMenuBarVisible
   set the visible of stack "revMenuBar" to true
   set the width of this stack to the width of stack "revMenuBar"
   set the left of this stack to the left of stack "revMenuBar"
   set the effective top of this stack to the effective bottom of \
         stack "revMenuBar" + the cpTopOffsetDocked of stack gStackName
   if not tMenuBarVisible then
      send "mouseUp" to button "BtnLCIDE" of group "Layout" of card "CrdMain"
   end if
   unlock screen

   insert the script of button "BtnFSHoverInfo" of card "CrdInfo" of stack gStackName into back
   ideSubscribe "ideToolChanged"

   --initializeIcons
   --send "initializeIcons" to stack gStackName in 0 ms
end openStack


on initializeIcons
   send "SetUpBar" to card "CrdMain" of stack gStackName
   send "resizeStack" to stack gStackName
end initializeIcons


on LoadWebApps
   local tCount
   local tNameList
   filter  fld "FldLaunchList" of card "CrdInfo" of stack gStackName without empty
   set the text of button "BtnLinks" of card "CrdMain" of stack gStackName to empty
   put empty into tNameList
   repeat with tCount = 1 to the number of lines of fld "FldLaunchList" of card "CrdInfo" of stack gStackName
      put item 1 of line tCount of fld "FldLaunchList" of card "CrdInfo" of stack gStackName & return after tNameList
   end repeat

   LoadTinyIDETools
   put "-" & return & gToolsFiles after tNameList

   set the text of button "BtnLinks" of card "CrdMain" of stack gStackName to tNameList
end LoadWebApps


on LoadTinyIDETools
   put the defaultfolder & "/TinyIDETools/" into gTooltPath
   put files(gTooltPath) into tToolsFiles
   filter tToolsFiles without ".DS_Store"
   if tToolsFiles is not empty then
      put tToolsFiles into gToolsFiles
   end if
end LoadTinyIDETools


on GetStackPath
   local tPath
   put the effective filename of me into tPath
   set the itemDel to "/"
   delete last item of tPath
   set the defaultFolder to tPath
end GetStackPath


on resizeStack
   local tULeft
   local tURight

   lock screen
   --main
   set the right of button "BtnExit" of card "CrdMain" to the right of card "CrdMain" -2
   set the right of button "BtnInfo" of card "CrdMain" to the left of button "BtnExit" of card "CrdMain" -2
   set the right of grp "Timer" of card "CrdMain" to the left of button "BtnInfo" of card "CrdMain" -2
   put the left of grp "Timer" of card "CrdMain" -2 into tURight
   put the right of grp "EditTools" of card "CrdMain" +2 into tULeft
   set the width of grp "UBarTools" of card "CrdMain" to tURight-tULeft
   set the left of grp "UBarTools" of card "CrdMain" to the right of grp "EditTools" of card "CrdMain" +2
   set the height of grp "UBarTools" of card "CrdMain" to 42
   set the top of grp "UBarTools" of card "CrdMain" to -1
   set the right of fld "LblVersion" of card "CrdMain" to the right of card "CrdMain" -2

   --settings/info
   set the right of button "BtnSaveStack" of card "CrdInfo" to the right of card "CrdInfo" -20
   set the right of button "Btn2108Web" of card "CrdInfo" to the left of button "BtnSaveStack" of card "CrdInfo" -4
   set the right of button "BtnCloseInfo" of card "CrdInfo" to the left of button "Btn2108Web" of card "CrdInfo" -4

   set the width of fld "FldStatus" of card "CrdMain" to item 3 of line 1 of the working screenRects -20
   set the left of fld "FldStatus" of card "CrdMain" to the left of card "CrdMain"
   unlock screen
end resizeStack


on ideToolChanged
   send "updateTool" to button "BtnRun-Edit" of card "CrdMain"
end ideToolChanged
