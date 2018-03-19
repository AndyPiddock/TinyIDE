script "button_IDEToolsButtonScript_1042"
on dragEnter
   call "dragEnter" to stack "revTools"
end dragEnter

on dragDrop
   call "dragDrop" to stack "revTools"
end dragDrop

on mouseEnter
   call "mouseEnter"  of stack "revTools"
end mouseEnter

on mouseLeave
   call "mouseLeave"  of stack "revTools"
   set the coloroverlay of the target to empty
end mouseLeave

on mouseDown
   call "mouseDown"  of stack "revTools"
end mouseDown

on mouseDoubleUp
   call "mouseDoubleUp"  of stack "revTools"
end mouseDoubleUp
