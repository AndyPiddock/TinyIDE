script "button_BtnMonitor1_1021"
on mouseUp
   local tSR, tWidth
   put the working screenrects into tSR
   lock screen
   if line 1 of tSR is not empty then
      put item 3 of line 1 of tSR - item 1 of line 1 of tSR - 20 into tWidth
      if the width of this stack = tWidth then
         set the width of this stack to the width of stack "revMenuBar"
         set the left of this stack to the left of stack "revMenuBar"
      else
         set the width of this stack to tWidth
         set the left of this stack to item 1 of line 1 of tSR +10
         set the top of this stack to item 2 of line 1 of tSR + \
               the cpTopOffsetMon1 of this stack
         set the visible of stack "revMenuBar" to false
         if there is a stack "revTools" then
            set the visible of stack "revTools" to false
         end if
      end if
   end if
   resizeStack
   unlock screen
end mouseUp
