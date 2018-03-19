script "button_BtnCloseInfo_10011"
global gStackYPos -- for recording and reseting top postion 
on mouseUp
   --1.22
   if the hilite of button "ToolsClassic" of card "CrdInfo" is "false" \
         AND the hilite of button "ToolsWidgets" of card "CrdInfo" is "false" \
         AND the hilite of button "ToolsGraphics" of card "CrdInfo" is "false" \
         AND the hilite of button "ToolsPaint" of card "CrdInfo" is "false"  then
      answer warning "No Tools selected, please select at least 1 option"
      
   else
      lock screen
      
      if the hilite of Button "HoverInfo" of card "CrdInfo" is true then
         set the height of this stack to "56"
      else
         set the height of this stack to "42"
      end if
      set the top of this stack to gStackYPos
      set the top of this stack to gStackYPos
      go card "CrdMain"
      resizeStack
      unlock screen
   end if
end mouseUp
