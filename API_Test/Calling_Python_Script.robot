*** Settings ***
Library    ../Resources/UserKeywords.py
*** Variables ***
${Value1}   Abhi
${Value2}   Dixit
*** Test Cases ***
Add two String
    ${value}=       Concatenate      ${Value1}    ${Value2}
    Log to console      ${value}
    Should be Equal     ${value}    Abhi Dixit