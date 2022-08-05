*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String
*** Test Cases ***
Launch OrangeHRM and login to application
    [Tags]    Regression
    Open Browser   https://opensource-demo.orangehrmlive.com/  chrome
    Maximize Browser Window
    Input Text  xpath=//input[@id='txtUsername']   Admin
    Input Text  name=txtPassword   admin123
    #Click Button  xpath=//input[@id='btnLogin']
    Click Button   css=input[id='btnLogin']
    #Element Text Should Be    link=Dashboard Dashboard
    Page Should Contain Link        Dashboard
Click on Admin->UserManagement->Users and Click on Add button
    #Mouse Over  link=Admin
    Mouse Over  link=Admin
    Sleep  2s
    Mouse Over  link=User Management
    Click Link  link=Users
    Click Button   name=btnAdd
Add Users Details->Verify User->Delete User->Verify User got Deleted
    ${random_num} =     Generate Random String
    ${empname}=     Catenate    SEPARATOR=    Abhi    ${random_num}
    LOG TO CONSOLE      ${empname}
    Set Global Variable   ${empname}
    Select From List By Label    id=systemUser_userType    Admin
    Input Text  id=systemUser_employeeName_empName  Fiona Grace
    Input Text  id=systemUser_userName  ${empname}
    Select From List By Value   id=systemUser_status    1
    Input Text  id=systemUser_password  admin123
    Input Text  id=systemUser_confirmPassword  admin123
    Click Button    id=btnSave
    Sleep   5s
    Page Should Contain Link        link=${empname}
    Sleep   2s
Delete
    Click Element       xpath=//a[text()='${empname}']//parent::td/../td/input
    Sleep   5s
    click button    id=btnDelete
    Sleep   2s
    click button    id=dialogDeleteBtn
    Sleep   2s
    page should not contain element     ${empname}
Close Browser at end
    Close Browser

