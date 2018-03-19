script "field_FldDefaultStackSizeWidth_34086"
on textChanged
   if the text of me is not a number then 
   beep
   delete char -1 of me
   exit textChanged
   end if
end textChanged
