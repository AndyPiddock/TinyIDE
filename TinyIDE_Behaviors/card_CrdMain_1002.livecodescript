script "card_CrdMain_1002"
global gStackName
global gStackYPos
local tMenuBarTemp
local tMenuCount


on OpenCard
   
   lock screen
   SetUpBar
   resizeStack
   
   --put the top of this stack into gStackYPos
   --send "mouseUp" to button "BtnCloseInfo" of card "CrdInfo" of stack gStackName
   unlock screen
   
end OpenCard

on SetUpBar
   
   
   --check Cps and action
   --is show object info set
   if the cpShowObjectInfo of stack gStackName is "true" then
      set the height of stack gStackName to 56
      set the hilite of button "HoverInfo" of card "CrdInfo" of stack gStackName to "true"
   else
      set the height of stack gStackName to 42
      set the hilite of button "HoverInfo" of card "CrdInfo" of stack gStackName to "false"
   end if
   
   --set up the menu bar
   
   if there is a grp "revMenuBar" of card "CrdMain" of stack gStackName then
      delete grp "revMenuBar" of card "CrdMain" of stack gStackName
      copy grp "revMenuBar" of stack "revMenuBar" to card "CrdMain" of stack gStackName
   else
      copy grp "revMenuBar" of stack "revMenuBar" to card "CrdMain" of stack gStackName
   end if
   set the height of  grp "revMenuBar" of card "CrdMain" of stack gStackName to 21
   set the top of  grp "revMenuBar" of card "CrdMain" of stack gStackName to -5
   set the textStyle of  grp "revMenuBar" of card "CrdMain" of stack gStackName to "normal"
   
   --amend the menu bar grp script to send commands to the LC IDE
   put the script of grp "revMenuBar" of card "CrdMain" of stack gStackName into tMenuBarTemp
   filter tMenuBarTemp without empty into tMenuBarTemp
   set the script of grp "revMenuBar" of card "CrdMain" of stack gStackName to empty
   put "Send " &quote&tMenuBarTemp&quote&" to stack "&quote&revMenuBar&quote into tMenuBarTemp
   set the script of grp "revMenuBar" of card "CrdMain" of stack gStackName to tMenuBarTemp 
   
   repeat with tMenuCount = 1 to the number of buttons of  grp "revMenuBar" of card "CrdMain" of stack gStackName     
      set the script of button tMenuCount of grp "revMenuBar" of me to empty
      set the script of button tMenuCount of grp "revMenuBar" of card "CrdMain" of stack gStackName to the script of button "BtnMenuPick" of card "CrdMain" of stack gStackName
   end repeat
   
   --set the edit mode
   choose "pointer" tool
   set the icon of button "BtnRun-Edit" of card "CrdMain" of stack gStackName to 8830
   
   
   --delete control groups
   if there is a group "classic" of grp "UBarTools" of card "CrdMain" of stack gStackName then
      delete group "classic" of grp "UBarTools" of card "CrdMain" of stack gStackName
   end if
   if there is a group "widget" of grp "UBarTools" of card "CrdMain" of stack gStackName then
      delete group "widget" of grp "UBarTools" of card "CrdMain" of stack gStackName
   end if
   if there is a group "graphic" of grp "UBarTools" of card "CrdMain" of stack gStackName then
      delete group "graphic" of grp "UBarTools" of card "CrdMain" of stack gStackName
   end if
   if there is a group "paint" of grp "UBarTools" of card "CrdMain" of stack gStackName then
      delete group "paint" of grp "UBarTools" of card "CrdMain" of stack gStackName
   end if
   
   if there is a group "paintcontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName then
      delete group "paintcontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName
   end if
   if there is a group "graphictools" of grp "UBarTools" of card "CrdMain" of stack gStackName then
      delete group "graphictools" of grp "UBarTools" of card "CrdMain" of stack gStackName
   end if
   if there is a group "graphictoolscontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName then
      delete group "graphictoolscontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName
   end if
   
   --Add Control grps to bar   
   --1.22
   local tClassicNumber,tCount,tWidgetNumber,tGraphicNumber,tControlsNumber,tPaintNumber,tPaintControlsNumber,tGraphicToolsNumber,tGraphicToolsControlNumber
   --copy controls
   if the cpToolsClassic of stack gStackName is "true"  then
      put the number of controls of grp "classic" of grp "contents" of card id 1002 of stack "revTools" into tClassicNumber
      copy grp "classic" of grp "contents" of card id 1002 of stack "revTools" to grp "UBarTools" of card "CrdMain" of stack gStackName
      repeat with tCount = 1 to tClassicNumber
         set the script of control tCount of grp "classic" of grp "UBarTools" of card "CrdMain" of stack gStackName to the script of btn "BtnClassicControlScript"
      end repeat
   end if
   
   if the cpToolsWidgets of stack gStackName is "true"  then
      put the number of controls of grp "widget" of grp "contents" of card id 1002 of stack "revTools" into tWidgetNumber
      copy grp "widget" of grp "contents" of card id 1002 of stack "revTools" to grp "UBarTools" of card "CrdMain" of stack gStackName
      repeat with tCount = 1 to tWidgetNumber
         set the script of control tCount of grp "widget" of grp "UBarTools" of card "CrdMain" of stack gStackName to the script of btn "BtnClassicControlScript"            
      end repeat
   end if
   
   if the cpToolsGraphics of stack gStackName is "true"  then
      put the number of controls of grp "graphic" of grp "contents" of card id 1002 of stack "revTools" into tGraphicNumber
      copy grp "graphic" of grp "contents" of card id 1002 of stack "revTools" to grp "UBarTools" of card "CrdMain" of stack gStackName
      repeat with tCount = 1 to tGraphicNumber
         set the script of control tCount of grp "graphic" of grp "UBarTools" of card "CrdMain" of stack gStackName to the script of btn "BtnClassicControlScript" 
      end repeat
   end if 
   
   if the cpToolsPaint of stack gStackName is "true"  then
      put the number of controls of grp "paint" of grp "contents" of card id 1002 of stack "revTools" into tPaintNumber
      copy grp "paint" of grp "contents" of card id 1002 of stack "revTools" to grp "UBarTools" of card "CrdMain" of stack gStackName
      repeat with tCount = 1 to tPaintNumber
         set the script of control tCount of grp "paint" of grp "UBarTools" of card "CrdMain" of stack gStackName to the script of btn "BtnClassicControlScript" 
      end repeat
   end if 
   
   --
   
   if the cpToolsPaintControls of stack gStackName is "true"  then
      put the number of controls of grp "paintcontrols" of grp "contents" of card id 1002 of stack "revTools" into tPaintControlsNumber
      copy grp "paintcontrols" of grp "contents" of card id 1002 of stack "revTools" to grp "UBarTools" of card "CrdMain" of stack gStackName
      repeat with tCount = 1 to tPaintControlsNumber
         set the script of control tCount of grp "paintcontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName to the script of btn "BtnClassicControlScript" 
      end repeat
   end if
   if the cpToolsGraphicTools of stack gStackName is "true"  then
      put the number of controls of grp "graphictools" of grp "contents" of card id 1002 of stack "revTools" into tGraphicToolsNumber
      copy grp "graphictools" of grp "contents" of card id 1002 of stack "revTools" to grp "UBarTools" of card "CrdMain" of stack gStackName
      repeat with tCount = 1 to tGraphicToolsNumber
         set the script of control tCount of grp "graphictools" of grp "UBarTools" of card "CrdMain" of stack gStackName to the script of btn "BtnClassicControlScript" 
      end repeat
   end if
   if the cpGraphicToolsControls of stack gStackName is "true"  then
      put the number of controls of grp "graphictoolscontrols" of grp "contents" of card id 1002 of stack "revTools" into tGraphicToolsControlNumber
      copy grp "graphictoolscontrols" of grp "contents" of card id 1002 of stack "revTools" to grp "UBarTools" of card "CrdMain" of stack gStackName
      repeat with tCount = 1 to tGraphicToolsControlNumber
         set the script of control tCount of grp "graphictoolscontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName to the script of btn "BtnClassicControlScript" 
      end repeat
   end if
   
   
   
   
   --aggrigate control totals   
   put tClassicNumber + tWidgetNumber + tGraphicNumber + tPaintNumber + tPaintControlsNumber into tControlsNumber
   
   --set the start location for the componants in the UBar group
   put the left of grp "UBarTools" of card "CrdMain" of stack gStackName into tUbarLeft
   put item 2 of the loc of grp "UBarTools" of card "CrdMain" of stack gStackName into tUbarTop
   
   --place the controls
   
   repeat with tCount = 1 to tClassicNumber
      if there is a grp "classic" of grp "UBarTools" of card "CrdMain" of stack gStackName then
         set the loc of control tCount of grp "classic" of grp "UBarTools" of card "CrdMain" of stack gStackName to tUbarLeft,tUbarTop
         put the width of control tCount of grp "classic" of grp "UBarTools" of card "CrdMain" of stack gStackName into tControlWidth
         put tUbarLeft +tControlWidth into tUbarLeft
      end if
   end repeat
   repeat with tCount = 1 to tWidgetNumber
      if there is a grp "widget" of grp "UBarTools" of card "CrdMain" of stack gStackName then
         set the loc of control tCount of grp "widget" of grp "UBarTools" of card "CrdMain" of stack gStackName to tUbarLeft,tUbarTop
         put the width of control tCount of grp "widget" of grp "UBarTools" of card "CrdMain" of stack gStackName into tControlWidth
         put tUbarLeft +tControlWidth into tUbarLeft
      end if
   end repeat
   repeat with tCount = 1 to tGraphicNumber
      if there is a grp "graphic" of grp "UBarTools" of card "CrdMain" of stack gStackName then
         set the loc of control tCount of grp "graphic" of grp "UBarTools" of card "CrdMain" of stack gStackName to tUbarLeft,tUbarTop
         put the width of control tCount of grp "graphic" of grp "UBarTools" of card "CrdMain" of stack gStackName into tControlWidth
         put tUbarLeft +tControlWidth into tUbarLeft
      end if
   end repeat
   repeat with tCount = 1 to tPaintNumber
      if there is a grp "paint" of grp "UBarTools" of card "CrdMain" of stack gStackName then
         set the loc of control tCount of grp "paint" of grp "UBarTools" of card "CrdMain" of stack gStackName to tUbarLeft,tUbarTop
         put the width of control tCount of grp "paint" of grp "UBarTools" of card "CrdMain" of stack gStackName into tControlWidth
         put tUbarLeft +tControlWidth into tUbarLeft
      end if
   end repeat
   
   --
   
   repeat with tCount = 1 to tPaintControlsNumber
      if there is a grp "paintcontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName then
         set the loc of control tCount of grp "paintcontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName to tUbarLeft,tUbarTop
         put the width of control tCount of grp "paintcontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName into tControlWidth
         put tUbarLeft +tControlWidth into tUbarLeft
      end if
   end repeat
   repeat with tCount = 1 to tGraphicToolsNumber
      if there is a grp "graphictools" of grp "UBarTools" of card "CrdMain" of stack gStackName then
         set the loc of control tCount of grp "graphictools" of grp "UBarTools" of card "CrdMain" of stack gStackName to tUbarLeft,tUbarTop
         put the width of control tCount of grp "graphictools" of grp "UBarTools" of card "CrdMain" of stack gStackName into tControlWidth
         put tUbarLeft +tControlWidth into tUbarLeft
      end if
   end repeat
   repeat with tCount = 1 to tGraphicToolsControlNumber
      if there is a grp "graphictoolscontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName then
         set the loc of control tCount of grp "graphictoolscontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName to tUbarLeft,tUbarTop
         put the width of control tCount of grp "graphictoolscontrols" of grp "UBarTools" of card "CrdMain" of stack gStackName into tControlWidth
         put tUbarLeft +tControlWidth into tUbarLeft
      end if
   end repeat
   
   
   
   send "mouseUp" to button "BtnGroupSelect" of grp "GroupingTools" of card "CrdMain" of stack gStackName
   
   
   --check Cps and action
   --is show Mac Men set
   local tIconOffset
   if the cpShowMacMenu of stack gStackName is "true" then
      set the visible of grp "revMenuBar" of card "CrdMain" of stack gStackName to "false"
      set the visible of grp "revMenuBar" of card "CrdInfo" of stack gStackName to "false"
      put 5 into tIconGroupTop
   else
      set the visible of grp "revMenuBar" of card "CrdMain" of stack gStackName to "true"
      set the visible of grp "revMenuBar" of card "CrdInfo" of stack gStackName to "true"
      put 12 into tIconGroupTop
   end if
   set the top of group "EditTools" of card "CrdMain" of stack gStackName to tIconGroupTop
   set the top of group "GroupingTools" of card "CrdMain" of stack gStackName to tIconGroupTop
   set the top of group "UsrApps" of card "CrdMain" of stack gStackName to tIconGroupTop
   set the top of group "Layout" of card "CrdMain" of stack gStackName to tIconGroupTop
   
end SetUpBar


on closeStack -- remove from scripts
   
   set the visible of stack "revMenuBar" to true
   set the visible of stack "revTools" to true
   set the effective top of stack "revMenuBar" to item 2 of the working screenRect
   set the effective left of stack "revMenuBar" to 0
   put the pendingmessages into myMsgs
   
   repeat for each line myMsg in myMsgs
      cancel item 1 of myMsg
   end repeat
   
   remove the script of button "BtnFSHoverInfo" of card "CrdInfo" of stack gStackName from back
   close stack "CodePeek"
   close this stack

end closeStack
