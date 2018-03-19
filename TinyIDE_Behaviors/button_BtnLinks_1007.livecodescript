script "button_BtnLinks_1007"
global gStackName
global gToolsPath --location of TinyIDETools folder
global gToolsFiles --files in the TinyIDETools folder


local tCount
local tNameList

on menuPick pItemName
   --web links, make sure that the case text matches the text list in the buttons properties
   repeat with tCount = 1 to the number of lines of fld "FldLaunchList" of card "CrdInfo" of stack gStackName
      put item 1 of line tCount of fld "FldLaunchList" of card "CrdInfo" of stack gStackName & return after tNameList
      if pItemName =  item 1of line tCount of fld "FldLaunchList" of card "CrdInfo" of stack gStackName then
         if  item 2 of line tCount of fld "FldLaunchList" of card "CrdInfo" of stack gStackName contains "http" then
            --web
            launch URL item 2 of line tCount of fld "FldLaunchList" of card "CrdInfo" of stack gStackName
         else
            --app
            launch item 2 of line tCount of fld "FldLaunchList" of card "CrdInfo" of stack gStackName
         end if
      end if
      
      
   end repeat
   
   put gToolsFiles after tNameList
   set the itemdel to "."
   
   if  item -1 of pItemName is "livecode" then
      go stack pItemName
   end if
   set the itemdel to comma
   
   
end menuPick
