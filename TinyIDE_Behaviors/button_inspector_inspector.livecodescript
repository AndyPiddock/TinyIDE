script "button_inspector_inspector"
on mouseUp
switch
case the CommandKey is down
send "menuPick" && "Card Inspector" to button "Object" of stack "revMenuBar"
break
case the OptionKey is down
send "menuPick" && "Stack Inspector" to button "Object" of stack "revMenuBar"
break
default
send "menuPick" && "Object Inspector" to button "Object" of stack "revMenuBar"
break
end switch
end mouseUp
