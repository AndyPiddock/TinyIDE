script "button_BtnSaveStack_13151"
global gStackYPos -- for recording and reseting top postion 
global gStackName --used to set the stack name during debug and editlocal tToolsPath

on mouseUp
   if fld "FldDefaultStackSizeWidth" of stack gStackName is empty OR fld "FldDefaultStackSizeHeight" of stack gStackName is empty then
      answer warning "Both width and height are required for the default stack size"
      exit to Top
   end if
   
   if fld "FldDefaultStackSizeWidth" of stack gStackName is not empty then
      set the cpDefaultStackSizeWidth of stack gStackName to fld "FldDefaultStackSizeWidth" of stack gStackName
   else 
      set the cpDefaultStackSizeWidth of stack gStackName to 0
   end if
   
   if fld "FldDefaultStackSizeHeight" of stack gStackName is not empty then
      set the cpDefaultStackSizeHeight of stack gStackName to fld "FldDefaultStackSizeHeight" of stack gStackName
   else 
      set the cpDefaultStackSizeHeight of stack gStackName to 0
   end if
   --1.22
   if the hilite of button "ToolsClassic" of card "CrdInfo" is "false" \
         AND the hilite of button "ToolsWidgets" of card "CrdInfo" is "false" \
         AND the hilite of button "ToolsGraphics" of card "CrdInfo" is "false" \
         AND the hilite of button "ToolsPaint" of card "CrdInfo" is "false"  then
      answer warning "No Tools selected, please select at least 1 option"
      
   else
      lock screen
      LoadWebApps
      if the hilite of Button "HoverInfo" is true then
         set the height of this stack to "56"
      else
         set the height of this stack to "42"
      end if   
      
      set the top of this stack to gStackYPos
      set the top of this stack to gStackYPos
      
      save this stack
      unlock screen
      go card "CrdMain" of stack gStackName
      
   end if
end mouseUp
