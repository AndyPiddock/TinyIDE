script "button_Monitor1TOffset_12827"
on menuPick 
   set the cpTopOffsetMon1 of this stack to the label of me
   if the visible of stack "revMenuBar" is false then
      lock screen
      -- sending twice to maintain current width
      send "mouseUp" to button "BtnMonitor1" of group "Layout" of card "CrdMain"
      send "mouseUp" to button "BtnMonitor1" of group "Layout" of card "CrdMain"
      unlock screen
   end if
end menuPick
