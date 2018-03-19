script "button_HoverInfo_13659"
global gStackName
on mouseUp
   put empty into fld "FldStatus" of card "CrdMain" of stack gStackName
   if the hilite of me is true then
          set the cpShowObjectInfo of this stack to "true"
   else
          set the cpShowObjectInfo of this stack to "false"
   end if
end mouseUp
