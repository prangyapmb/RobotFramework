*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    Open Browser    https://www.google.com/  chrome
    Maximize Browser Window
    Input Text name=q selenium
    Press Keys  name=q  RETURN
    #Press Keys  xpath=//*[@id='tsf']//div[2]/div/ul/li    RETURN
    @{result_on_page}=      Get WebElements     xpath=//div[@id='rso']/div
    ${cnt}=         Get Element count       xpath=//div[@id='rso']/div
    Log to Console   ${cnt}
    FOR     ${element}  IN      @{result_on_page}
        ${text}=    Get Text    ${element}
        Log to Console    ${text}
    END
    Close Browser