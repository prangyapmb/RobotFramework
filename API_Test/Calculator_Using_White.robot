*** Variables ***
${TEST APPLICATION}        notepad.exe
*** Settings ***
Library        WhiteLibrary
*** Test Cases ***
Notepad Example
    Launch Application     ${TEST APPLICATION}
    Attach Window  Untitled - Notepad
    Press Keys      Welcome Abhi
    Sleep       2s
    ${act_text}=        Get text from textbox   id:15
    Should be Equal     ${act_text}     Welcome Abhi
    Log to console      ${act_text}
    Click menu Button       text:File
    Click menu Button       text:Save
    #Click item      id:1001
    Sleep       2s
    Press Keys      C:\\RobotFramework\\Myfile.txt
    Click Button        text:Save
    Click Button        text:Yes
    Sleep       2s
    Close Application