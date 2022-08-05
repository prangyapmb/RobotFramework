*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    ../TestData/ConfigData.robot

*** Keywords ***
LaunchApplication
    Open Browser        ${url}      ${browser}
    Maximize Browser Window
    #Sleep   2s
CloseApp
    Close Browser
Enter Username
    [Arguments]     ${username}
    Input Text      ${txtbox_username}      ${username}
Enter Password
    [Arguments]     ${password}
    Input Text      ${txtbox_password}      ${password}
Click On Login Button
    Click Button        ${btn_login}
Click On Logout Link
    Click link      ${lnk_welcome}
    Sleep       2s
    Click link      ${lnk_logout}
Verify Home Page
    Page Should Contain     Dashboard