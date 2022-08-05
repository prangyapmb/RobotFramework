*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Launch OrangeHRM Login Page
    [Tags]    Smoke
    Open Browser   https://opensource-demo.orangehrmlive.com/   chrome
    Maximize Browser Window
    Input Text  xpath=//input[@id='txtUsername']   Admin
    Input Text  name=txtPassword   admin123
    #Click Button  xpath=//input[@id='btnLogin']
    Click Button   css=input[id='btnLogin']
    #Element Text Should Be    link=Dashboard Dashboard
    Page Should Contain Link        Dashboard   timeout=5
    #Verify that user is on Dashboard page
    Element Text Should Be link=Dashboard Dashboard
    close browser
TC_001-Launch WebOrder and login to application
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete
    close browser
Verify that a string can be written and read from a Simple Iframe
    [documentation]  This test case handle iframe
    Open Browser  https://netbanking.hdfcbank.com/netbanking/  Chrome
    Wait Until Element Is Visible  xpath=//frame[@name='login_page']  timeout=5
    select frame  name=login_page
    Input Text      css=input[name='fldLoginUserId']      1000
    click element    xpath=//a[normalize-space()='CONTINUE']
    element should contain  xpath=//span[normalize-space()='Password/ IPIN']    Password/ IPIN
    Sleep       2s
    close browser