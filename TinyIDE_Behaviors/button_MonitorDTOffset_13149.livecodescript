script "button_MonitorDTOffset_13149"
global gStackYPos
on menuPick 
   set the cpTopOffsetDocked of this stack to the label of me
   if the visible of stack "revMenuBar" is true then
      lock screen
      set the effective top of this stack to the effective bottom of \
            stack "revMenuBar" + the cpTopOffsetDocked of this stack
      put the top of this stack into gStackYPos
      unlock screen
   end if
end menuPick
