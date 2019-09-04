script "button_BtnFSHoverInfo_13660"
global gStackName
local tSL
local tSC
local tCount
local tSCO

on mouseEnter
   if the mouseStack contains "rev" is false then
      if the mouseStack is not gStackName then
         if the mouseStack is not "CodePeek" then

               switch
           # Note CMDKEY is Command Key on Mac and Control on Windows and Linux
           #          OPTIONKEY is Alt key on Windows and Unix and Option key on Mac
           #          OBJECT is the the object under the mouse
           #
           # When an object is detected then eg  field, button, group etc then
           #
           # No keys held down will show the script of the OBJECT
           # CMDKEY down will show the text property of the OBJECT
           # OPTIONKEY down will show the custom properties of the OBJECT
           # CMDKEY down and SHIFT will show the card script
           # OPTIONKEY down and SHIFT will show the stack script

           case the OptionKey is down and the ShiftKey is down
              # show the stack script when entering hovering over a control
              put StackOf(the target) into tStackID
              put the script of tStackID into tScript
              put "STACK" && the short name of tStackID & cr &  the script of tStackID into  tScript
              if not (tScript is empty) then
                 set the backgroundcolor of fld "CodeList" of stack "CodePeek" to "Gray30"
                 try
                    if the cpCodePeek of stack gStackName is "true" then
                       if the openStacks contains "CodePeek" is false then
                          open stack "CodePeek"
                       end if
                       set the htmltext of of fld "CodeList" of stack "CodePeek" to colorScript(tScript)
                    end if
                 catch errorMess
                 end try
              end if
              break

           case the CommandKey is down and the ShiftKey is down
              # show the card script when entering hovering over a control
              put CardOf(the target) into tCardID
              put the script of tCardID into tScript
              put "CARD" && the short name of tCardID & cr &  the script of tCardID into  tScript
              if not (tScript is empty) then
                 set the backgroundcolor of fld "CodeList" of stack "CodePeek" to "dark red"
                 try
                    if the cpCodePeek of stack gStackName is "true" then
                       if the openStacks contains "CodePeek" is false then
                          open stack "CodePeek"
                       end if
                       set the htmltext of of fld "CodeList" of stack "CodePeek" to colorScript(tScript)
                    end if
                 catch errorMess
                 end try
              end if
              break

           case the OptionKey is down
              # show the custom properties of this control
              set the backgroundcolor of fld "CodeList" of stack "CodePeek" to "dark blue"
              try
                 if the cpCodePeek of stack gStackName is "true" then
                    if the openStacks contains "CodePeek" is false then
                       open stack "CodePeek"
                    end if
                    put "CUSTOM PROPERTIES" & cr  into fld "CodeList" of stack "CodePeek"
                    repeat for each line tKey in the customKeys of the target
                       if not(the tKey of the target  is empty) then
                          put the tKey of the target into tProperty
                          put tKey & tab & tProperty  & cr after fld "CodeList" of stack "CodePeek"
                       end if
                    end repeat
                 end if
              catch errorMess
              end try
              break


           case the CommandKey is down
              # show text property of object (if it has a text property)
              # CommandKey should also detect the Control Key on Windows and Linux Systems
              try
                 set the backgroundcolor of fld "CodeList" of stack "CodePeek" to "dark green"
                 if the cpCodePeek of stack gStackName is "true" then
                    put "TEXT PROPERTY" & cr & the text of the target into tProperty
                    if the openStacks contains "CodePeek" is false then
                       open stack "CodePeek"
                       put tProperty into fld "CodeList" of stack "CodePeek"
                    end if
                    put tProperty into fld "CodeList" of stack "CodePeek"
                 end if
              catch errorMess
              end try
              break

           default
              # no keys held down show script of control
              set the backgroundcolor of fld "CodeList" of stack "CodePeek" to "black"
              try
                  if the icon of button "Select Grouped" of stack "revMenuBar" is 101046 then
                    # Select Groupd is on
                    put "GROUP SCRIPT" & cr & the script of gGroupID into tScript
                    put the number of lines of the script of gGroupID into tSL
                 else
                    put "OBJECT SCRIPT" & cr & the script of the target into tScript
                    put the number of lines of the script of the target into tSL
                 end if

                 if the cpCodePeek of stack gStackName is "true" then
                    if the openStacks contains "CodePeek" is false then
                       open stack "CodePeek"
                       #Original code - put the script of the target into fld "CodeList" of stack "CodePeek"
                       set the htmltext of fld "CodeList" of stack "CodePeek" to colorScript(tScript)
                    end if
                    #Original code - put the script of the target into fld "CodeList" of stack "CodePeek"
                    set the htmltext of fld "CodeList" of stack "CodePeek" to colorScript(tScript)
                 end if
              catch errorMess
              end try
              break
        end switch

        put the long name of the target & "  id "& the id of the target &"  z="& the Layer of the target & "   x="& the left of the target &"   y="& the top of the target &"   w="& the width of the target & "   h="& the height of the target& "  sc="&tSL  into fld "FldStatus" of card "CrdMain" of stack gStackName
     end if
  end if

end if

if the mouseStack is empty then
put empty into fld "FldStatus" of card "CrdMain" of stack gStackName
end if

end mouseEnter

on mouseDown theButton

if theButton is 3 then
put the long name of the target into tSelected
if the mouseStack is not gStackName then
--if the mouseStack is not "CodePeek" then
lock messages
revIDEPopupContextualMenu tSelected
unlock messages
--end if
end if
else
pass mouseDown
end if

end mouseDown

function colorScript pScript
constant cKeyWords="& && after ask among answer ask bottom btn button call card catch char contains each else field filter fld for get go group grp height if into is label left line lines lock long messages milliseconds name not of pass put repeat right screen seconds send set short stack target text the then to top try unlock wait widget width with word words"
constant cSpecialChars="quote tab space cr"
put empty into tHTML
put "<font color=" & quote & "white" & quote & ">" into tSTEXT
put "" into tETEXT
put "<font color=" & quote & "yellow" & quote & ">" into tSLITERAL
put "" into tELITERAL
put "<font color=" & quote & "pink" & quote & ">" into tSCMD
put "" into tECMD
put "<font color=" & quote & "green" & quote & ">" into tSNAME
put "" into tENAME
put "<font color=" & quote & "light blue" & quote & ">" into tSPARAM
put "" into tEPARAM
put pScript into tScript
put "<font color=" & quote & "red" & quote & ">" into tSKW
put "" into tEKW
put "<font color=" & quote & "light blue" & quote & ">" into tSNUMBER
put "" into tENUMBER
put "<font color=" & quote & "light blue" & quote & ">" into tSPROPERTY
put "" into tEPROPERTY

repeat for each line theLine in tScript
switch
case word 1 of theLine begins with "--" or word 1 of theLine begins with "#"
# comment line
put tSNAME & theLine & tENAME & "" after tHTML
break

     case theLine contains "end if" or \
           theLine contains "end try" or \
           theLine contains "end repeat"
        # fixed end values
        put tSCMD & theLine & tECMD & "<br>" after tHTML
        break

     case word 1 of theLine is among the words "on end command function"
        #  command/functions definitions
        put word 1 of theLine into tkeyword
        put word 2 of theLine into tName
        put tSCMD & tKeyword & tECMD & space & \
              tSNAME & tName & tENAME after tHTML
        repeat for each word theWord in word 3 to -1 of theLine
           put space & tSPARAM & theWord & tEPARAM after tHTML
        end repeat
        put "<br>" after tHTML
        break

     case word 1 of theLine is among the words "global local script constant"
        # variables/scripts/constants
        put word 1 of theLine into tkeyword
        put word 2 of theLine into tName
        put tSCMD & tKeyword & tECMD & space & \
              tSTEXT & tName & tETEXT after tHTML
        repeat for each word theWord in word 3 to -1 of theLine
           put space & tSTEXT & theWord & tETEXT after tHTML
        end repeat
        put "<br>" after tHTML
        break

     case findInCodeLine(cKeyWords,theLine)  is true
        put theLine into tLine
        # get leading spaces of code line
        put empty into tLeadingChars
        repeat for each char theChar in tLine
           if theChar is not space then exit repeat
           put space after tLeadingChars
        end repeat
        put tLeadingChars after tHTML

        #colorize each word as required
        put empty into tPreviousWord
        repeat for each word theWord in tLine
           if theWord is among the words cKeyWords then
              # Livecode commands
              put tSCMD & theWord & tECMD & space  after tHTML
           else
              if theWord begins with quote and theWord ends with quote then
                 # leterals
                 if theWord contains "<" or theWord contains ">" then #handle html in literal
                    replace "<" with "&lt;" in theWord
                    replace ">" with "&gt;" in theWord
                 end if
                 put  tSLITERAL & theWord & tELITERAL & space after tHTML
              else
                 # Numbers
                 if isNumber(theWord) or theWord is among the words cSpecialChars then
                    put  tSNUMBER & theWord & tENUMBER & space after tHTML
                 else
                    if tPreviousWord is "the" then
                       # property reference
                       put  tSPROPERTY & theWord & tEPROPERTY & space after tHTML
                    else
                       # default coloring
                       put  tSTEXT & theWord & tETEXT & space after tHTML
                    end if
                 end if
              end if
           end if
           put theWord into tPreviousWord
        end repeat
        put "<br>" after tHTML
        break
     default
        put tSTEXT & theLine & tETEXT & "<br>" after tHTML
  end switch

end repeat
return tHTML
end colorScript

function findInCodeLine pWords,PCodeLine
put false into tResult
repeat for each word theWord in pWords
if toLower(theWord) is in toLower(pCodeLine) then
put true into tResult
exit repeat
end if
end repeat
return tResult
end findInCodeLine

function StackOf pControl
local theCharNo

put the long id of pControl into pControl ## force the long id

if word 1 of pControl is not "stack" then
put offset(" of stack ", pControl) into theCharNo
if theCharNo > 0 then
delete char 1 to (theCharNo + 3) of pControl
else
put empty into pControl
end if
end if
return pControl
end StackOf

function CardOf pControl
local theCharNo

put the long id of pControl into pControl ## force the long id

if word 1 of pControl is not "card" then
put offset(" of card ", pControl) into theCharNo
if theCharNo > 0 then
delete char 1 to (theCharNo + 3) of pControl
else
put empty into pControl
end if
end if
return pControl
end CardOf

function GroupOf pControl
local theCharNo

put the long id of pControl into pControl ## force the long id

if word 1 of pControl is not "card" then
put offset(" of group ", pControl) into theCharNo
if theCharNo > 0 then
delete char 1 to (theCharNo + 3) of pControl
else
put empty into pControl
end if
end if
return pControl
end GroupOf

on mouseLeave
put empty into fld "CodeList" of stack "CodePeek"
end mouseLeave
