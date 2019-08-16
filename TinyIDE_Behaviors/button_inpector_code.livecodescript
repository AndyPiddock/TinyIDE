script "button_inpector_code"
on mouseUp
switch
case the CommandKey is down
send "menuPick" && "Card Script" to button "Object" of stack "revMenuBar"
break
case the OptionKey is down
send "menuPick" && "Stack Script" to button "Object" of stack "revMenuBar"
break
default
send "menuPick" && "Object Script" to button "Object" of stack "revMenuBar"
break
end switch
end mouseUp
