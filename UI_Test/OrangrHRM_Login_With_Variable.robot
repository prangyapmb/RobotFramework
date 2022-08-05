*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
*** Variables ***
${url}      http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx
${browser}      firefox

*** Test Cases ***
Launch OrangeHRM Login Page
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Input Text  name=txtUsername   Admin
    Input Text  name=txtPassword   admin123
    Click Button    xpath=//input[@id='btnLogin']
    Element Text Should Be  link=Dashboard  Dashboard
    Close Browser