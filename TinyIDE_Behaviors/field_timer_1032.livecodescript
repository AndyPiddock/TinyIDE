script "field_timer_1032"
on mouseUp 
   set the backcolor of button "BtnTimer" to empty
   --cancel item 1 of the last line of the pendingmessages 
   set the label of btn "BtnTimer" to "start" 
   put "0.000" into fld "timer" 
end mouseUp
