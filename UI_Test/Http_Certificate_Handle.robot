*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Handle HTTP Certificate error
    Open Browser    https://expired.badssl.com/    chrome    options=add_argument("--ignore-certificate-errors")
    #Open Browser    https://expired.badssl.com/    chrome
    Sleep   3s
    title should be     expired.badssl.com
    #Capture Page Screenshot
    Close All Browsers