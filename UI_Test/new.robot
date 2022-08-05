*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
*** Test Cases ***
Test for open and login to the page
    [Tags]    DEBUG
    #open browser    https://opensource-demo.orangehrmlive.com/index.php/dashboard   chrome
    open browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     chrome
    #input text      name=txtUsername    Admin
    input text      id=ctl00_MainContent_username    Tester
    #input text      id=txtPassword  admin123
    input text      id=ctl00_MainContent_password  test
    #click button    btnLogin
    click button    ctl00_MainContent_login_button
    page should contain element     ctl00_MainContent_btnDelete
    click element   ctl00_logout
    #element text should be    link=Dashboard  Dashboard
    sleep   5s
    close browser
    #click button    submit

*** Keywords ***
Provided precondition
    Setup system under test