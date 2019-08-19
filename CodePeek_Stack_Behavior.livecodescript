script "CodePeek_Stack_Behavior"
global gStackName
on openStack
   set the style of stack "CodePeek" to "modeless"
   put empty into fld "CodeList"
   go stack gStackName
end openStack
on resizeStack
   set the width of fld "CodeList" to the width of card "CrdMain" of stack "CodePeek"
   set the left of fld "CodeList" to the left of card "CrdMain" of stack "CodePeek"
   set the height of fld "CodeList" to the height of card "CrdMain" of stack "CodePeek"
   set the top of fld "CodeList" to the top of card "CrdMain" of stack "CodePeek"
end resizeStack
