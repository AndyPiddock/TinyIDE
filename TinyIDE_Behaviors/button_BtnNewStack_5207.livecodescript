script "button_BtnNewStack_5207"
global gStackName --used to set the stack name during debug and editlocal tToolsPath
on mouseUp
   create stack
   
   set the width of the topStack to the cpDefaultStackSizeWidth of stack gStackName
   set the height of the topStack to the cpDefaultStackSizeHeight of stack gStackName
   
   if the cpDefaultStackSizeWidth of stack gStackName is 0 then
      set the width of the topStack to 240
   end if
   if the cpDefaultStackSizeHeight of stack gStackName is 0 then
      set the height of the topStack to 320
   end if
   set the top of the topStack to 200
   send "menuPick" && "Stack Inspector" to button "Object" of stack "revMenuBar"
end mouseUp
