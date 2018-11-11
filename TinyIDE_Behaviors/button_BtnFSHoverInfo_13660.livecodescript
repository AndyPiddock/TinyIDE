script "button_BtnFSHoverInfo_13660"
global gStackName
local tSL
local tSC
local tCount
local tSCO

on mouseEnter
   if the mouseStack contains "rev" is false then
      if the mouseStack is not gStackName then
         if the mouseStack is not "CodePeek" then
            try
               put the number of lines of the script of the target into tSL
               if the cpCodePeek of stack gStackName is "true" then
                  if the openStacks contains "CodePeek" is false then
                     open stack "CodePeek"
                     put the script of the target into fld "CodeList" of stack "CodePeek"
                  end if
                  put the script of the target into fld "CodeList" of stack "CodePeek"
               end if
               
               put the long name of the target & "  id "& the id of the target &"  z="& the Layer of the target & "   x="& the left of the target &"   y="& the top of the target &"   w="& the width of the target & "   h="& the height of the target& "  sc="&tSL  into fld "FldStatus" of card "CrdMain" of stack gStackName
            catch errorMess
               
            end try
         end if
      end if
   end if
   
   if the mouseStack is empty then
      put empty into fld "FldStatus" of card "CrdMain" of stack gStackName
   end if
   
end mouseEnter

on mouseDown theButton 
   
   if theButton is 3 then 
      put the long name of the target into tSelected
      if the mouseStack is not gStackName then
         --if the mouseStack is not "CodePeek" then
            lock messages
            revIDEPopupContextualMenu tSelected
            unlock messages
         --end if
      end if
   else 
      pass mouseDown
   end if
   
end mouseDown
