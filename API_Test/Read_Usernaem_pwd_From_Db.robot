*** Settings ***
Library     DatabaseLibrary
Library     SeleniumLibrary
Library     OperatingSystem


*** Variables ***
${dbname}       weborders
${dbuser}       root
${dbpasswd}     Welcome@123
${dbhost}       localhost
${dbport}       3306
*** Test Cases ***
Read data from Database
   connect to database     pymysql     ${dbname}    ${dbuser}   ${dbpasswd}     ${dbhost}   ${dbport}
   table must exist     login
   check if exists in database  SELECT * FROM login
   @{queryResults}  QUERY   SELECT * FROM login
   Open Browser    http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx     chrome
   Maximize Browser Window
   log to console       ${queryResults}
   FOR    ${result}    IN    @{queryResults}
        Input Text  id=ctl00_MainContent_username  ${result}[0]
        Input Text  id=ctl00_MainContent_password  ${result}[1]
        Click Button    id=ctl00_MainContent_login_button
        Sleep   2s
        Element Text Should Be  link=View all orders   View all orders
        Click Link      link=Logout
   END
Close OrangeHRM Login Page
    Close Browser