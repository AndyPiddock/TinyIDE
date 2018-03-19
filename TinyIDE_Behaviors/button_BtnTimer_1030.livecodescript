script "button_BtnTimer_1030"
on mouseDown 
   lock screen 
   if the label of me = "start" then 
      set the backcolor of me to "185,239,234"
      set the label of me to "stop" 
      set the startingTime of me to the milliseconds 
      replace "." with empty in fld "timer"   --temp 
      set the oldTime of me to fld "timer" 
      send "countUp" to me in 1 millisecond 
   else 
      set the label of me to "start" 
      set the backcolor of me to empty
   end if 
end mouseDown 

on countUp 
   put (the milliseconds - the startingTime of me) + the oldTime of me into   temp 
   put "." before char   the number of chars of temp -2 of temp 
   if the length   of temp <= 4 then put "0" & temp into fld "timer" else 
   put temp into fld "timer"    
   if the label of btn "BtnTimer" = "stop" then send "countUp" to me in 1 millisecond 
end countUp 
