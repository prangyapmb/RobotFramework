*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
*** Test Cases ***
Test for open and login to the page
    [Tags]    DEBUG
    #open browser    https://opensource-demo.orangehrmlive.com/index.php/dashboard   chrome
    open browser    https://opensource-demo.orangehrmlive.com/index.php/dashboard/  headlesschrome
    #input text      name=txtUsername    Admin
    input text      xpath=//input[@id='txtUsername']    Admin
    #input text      id=txtPassword  admin123
    input text      css=input[id='txtPassword']  admin123
    #click button    btnLogin
    click button    class=button
    #page should contain link    Dashboard
    #element text should be    link=Dashboard  Dashboard
    close browser
    #click button    submit

*** Keywords ***
Provided precondition
    Setup system under test