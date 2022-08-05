*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem
Library     SeleniumLibrary
Library     Collections
*** Variables ***
${dbname}       weborders
${dbuser}       root
${dbpasswd}     Welcome@123
${dbhost}       localhost
${dbport}       3306
@{queryResults}
*** Test Cases ***
Verify that you can Delete a Table
    [documentation]  This test case verifies that a user can delete a Table
    Connect DB
    ${output}=  Execute SQL String  DROP TABLE Persons;
    Should Be Equal As Strings  ${output}  None
    Disconnect DB
*** Keywords ***
Connect DB
    connect to database     pymysql     ${dbname}   ${dbuser}   ${dbpasswd}     ${dbhost}   ${dbport}
Disconnect DB
    Disconnect From Database

