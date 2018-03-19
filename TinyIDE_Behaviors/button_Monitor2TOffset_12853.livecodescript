script "button_Monitor2TOffset_12853"
on menuPick 
   set the cpTopOffsetMon2 of this stack to the label of me
   if the visible of stack "revMenuBar" is false then
      lock screen
      -- sending twice to maintain current width
      send "mouseUp" to button "BtnMonitor2" of group "Layout" of card "CrdMain"
      send "mouseUp" to button "BtnMonitor2" of group "Layout" of card "CrdMain"
      unlock screen
   end if
end menuPick
