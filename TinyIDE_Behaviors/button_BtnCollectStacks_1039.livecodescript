script "button_BtnCollectStacks_1039"
on mouseUp
   --1.22
   if there is a stack "CollectMyStacks" then
      go stack "CollectMyStacks"
   else
      --
      local tStack
      local tOpenStacks
      local tCountOS
      local tWidth
      local tHeight
      local tArea
      local tStackOrder
      local tLevelCount
      local tmyArray
      local tmyKeys
      local tOkey
      local tStackSort
      --collect all open stacks and their area, put in an array for sorting
      put the openstacks into tOpenStacks
      repeat with tCountOS = 1 to the number of lines of tOpenStacks
         if line tCountOS of tOpenStacks is not among the words of "revMenuBar revTools revTinyIDE TinyIDE" then
            put line tCountOS of tOpenStacks into tStack
            put the width of stack tStack into tWidth
            put the height of stack tStack into tHeight
            put tWidth*tHeight into tArea
            put tArea,tStack into tmyArray[tArea,tStack]
         end if
      end repeat
      
      --sort the array by largest area
      put the keys of tmyArray into tmyKeys 
      sort tmyKeys numeric descending
      put tmyKeys into tStackOrder
      --loop through ordered stacks
      put 1 into tLevelCount
      repeat for each line tOkey in tStackOrder
         --get the stack name
         put item 2 of tmyArray[tOkey] into tStackSort
         --position stack
         if there is a stack "revTinyIDE" then --live
            set the top of stack tStackSort to the bottom of stack "revTinyIDE" + (40*tLevelCount)
            set the left of stack tStackSort to the left of stack "revTinyIDE" + (80*tLevelCount)
         end if
         if there is a stack "TinyIDE" then --dev
            set the top of stack tStackSort to the bottom of stack "TinyIDE" + (40*tLevelCount)
            set the left of stack tStackSort to the left of stack "TinyIDE" + (80*tLevelCount)
         end if
         --go to the stack to set its order level
         go stack tStackSort
         add 1 to tLevelCount
      end repeat 
      
   end if
   
end mouseUp
