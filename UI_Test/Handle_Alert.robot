*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Click on JS Alert
    Open Browser    https://the-internet.herokuapp.com/javascript_alerts    chrome

    Click Element       xpath=//button[normalize-space()='Click for JS Alert']
    Sleep    2s
    Alert Should Be Present     I am a JS Alert     ACCEPT
    Sleep    2s
    Element Text Should Be      //p[@id='result']       You successfully clicked an alert

Click for JS Confirm
    Click Element       xpath=//button[normalize-space()='Click for JS Confirm']
    Sleep    2s
    Alert Should Be Present     I am a JS Confirm     DISMISS
    Sleep    2s
    Element Text Should Be      //p[@id='result']       You clicked: Cancel

Enter the Text in Alert Input Box
    Click Button    xpath=//button[text()='Click for JS Prompt']
    Sleep   2s
    #Alert Should Be Present     I am a JS prompt
    Input Text Into Alert   Robot   ACCEPT
    Sleep   2s
    Element Text Should Be  id=result   You entered: Robot
    #Close Browser
    close browser