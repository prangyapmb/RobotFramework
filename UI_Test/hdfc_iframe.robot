*** Settings ***
Documentation  Iframes in Robot Framework
Library  SeleniumLibrary

*** Variables ***
*** Test Cases ***
Verify that a string can be written and read from a Simple Iframe
    [documentation]  This test case handle iframe
    Open Browser  https://netbanking.hdfcbank.com/netbanking/  Chrome
    Wait Until Element Is Visible  xpath=//frame[@name='login_page']  timeout=5
    select frame  name=login_page
    Input Text      css=input[name='fldLoginUserId']      1000
    click element    xpath=//a[normalize-space()='CONTINUE']
    element should contain  xpath=//span[normalize-space()='Password/ IPIN']    Password/ IPIN
    Sleep       2s
    Close Browser