*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     String

*** Test Cases ***
TC_001-Launch WebOrder and login to application
    [Tags]      Test
    Open Browser    http://secure.smartbearsoftware.com/samples/testcomplete11/WebOrders/Default.aspx    Chrome
    Maximize Browser Window
    Input Text    id=ctl00_MainContent_username    Tester
    Input Text    id=ctl00_MainContent_password    test
    Click Button  id=ctl00_MainContent_login_button
    Page Should Contain Button    id=ctl00_MainContent_btnDelete

Click on Order and Enter the Details
    Click Link      link=Order
    Sleep       2s
    Select From List By Label  id=ctl00_MainContent_fmwOrder_ddlProduct    FamilyAlbum
    Input Text id=ctl00_MainContent_fmwOrder_txtName       Dixit
    Input Text  id=ctl00_MainContent_fmwOrder_txtQuantity   5
    Input Text id=ctl00_MainContent_fmwOrder_TextBox2       MG Road
    Input Text id=ctl00_MainContent_fmwOrder_TextBox3       Bangalore
    Input Text id=ctl00_MainContent_fmwOrder_TextBox5       560001
    Select Radio Button     ctl00$MainContent$fmwOrder$cardList        Visa
    Input Text id=ctl00_MainContent_fmwOrder_TextBox6       123456789
    Input Text id=ctl00_MainContent_fmwOrder_TextBox1       12/22
    Click Element       id=ctl00_MainContent_fmwOrder_InsertButton
Go to View All Orders and Verify that user got added
    Click Link      link=View all orders
    Sleep       2s
    Click Element       xpath=//td[normalize-space()='Dixit']//following-sibling::td/input
    Sleep   2s
    Page Should Contain     Edit Order
    Sleep   5s
Edit the State field and Verify that its Updated
    Input Text     id=ctl00_MainContent_fmwOrder_TextBox3       Delhi
    Click Element       id=ctl00_MainContent_fmwOrder_UpdateButton
    Sleep       2s
    Page Should Contain Element     xpath=//td[normalize-space()='Dixit']//following-sibling::td[normalize-space()='Delhi']

Delete the user and Verify that user got deleted from WebTable
    Click Element       xpath=//td[normalize-space()='Dixit']//preceding-sibling::td/input
    Click Element       id=ctl00_MainContent_btnDelete
    Sleep       2s
    page should not contain element      Dixit

Logout and Close Browser at end
    Click Link      Logout
    Page Should Contain Button    id=ctl00_MainContent_login_button

Close Browser at end
    Close Browser