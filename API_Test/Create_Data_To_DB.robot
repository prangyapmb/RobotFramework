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
Verify Successful creation of Table
    [documentation]  This test case verifies that user is able to create a table successfully
    Connect DB
    table must exist     login
    ${output}=  Execute SQL String  CREATE TABLE Persons (PersonID int, FirstName varchar(255), Address varchar(255), City varchar(255));
    Should Be Equal As Strings  ${output}  None

Insert data Into Database
   Connect DB
   # Update JMETER to ROBOT in Login table for uname column
   ${output}=   Execute Sql String     Insert into Persons values(1001,"AddingRobot","BTM","Bangalore")
   Should Be Equal As Strings  ${output}  None
   Disconnect DB
*** Keywords ***
Connect DB
    connect to database     pymysql     ${dbname}    ${dbuser}   ${dbpasswd}     ${dbhost}   ${dbport}
Disconnect DB
    Disconnect From Database