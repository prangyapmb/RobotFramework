*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
*** Variables ***
${search_text}  mobile
*** Test Cases ***
Search for Product
    Open Browser   https://www.amazon.in/   chrome
    Input Text  id=twotabsearchtextbox  ${search_text}
    Click Button   xpath=//input[@value='Go']
    Sleep  5s
    Page Should Contain    results for "${search_text}"
Close browser at end
    Close Browser



