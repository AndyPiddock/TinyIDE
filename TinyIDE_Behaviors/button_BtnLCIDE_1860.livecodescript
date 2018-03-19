script "button_BtnLCIDE_1860"
global gStackYPos
on mouseUp
   lock screen
   if the visible of stack "revMenuBar" is true then
      set the visible of stack "revMenuBar" to false
      set the top of this stack to item 2 of the working screenRect + \
            the cpTopOffsetMon1 of this stack
      set the left of this stack to 0
      if there is a stack "revTools" then
         set the visible of stack "revTools" to false
      end if
   else
      set the visible of stack "revMenuBar" to true
      set the effective top of this stack to the effective bottom of \
            stack "revMenuBar" + the cpTopOffsetDocked of this stack
      set the effective left of stack "revMenuBar" to 0
      set the width of this stack to the width of stack "revMenuBar"
      set the left of this stack to the left of stack "revMenuBar"
      set the visible of stack "revTools" to true
   end if   
   put the top of this stack into gStackYPos
   resizeStack
   unlock screen
end mouseUp
