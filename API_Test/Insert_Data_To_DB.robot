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
Insert data Into Database
   Connect DB
   # Update JMETER to ROBOT in Login table for uname column
   ${output}=       Execute Sql String     insert into login values('dipti','test123')
   Should Be Equal As Strings  ${output}  None
   Disconnect DB
*** Keywords ***
Connect DB
    connect to database     pymysql     ${dbname}    ${dbuser}   ${dbpasswd}     ${dbhost}   ${dbport}
Disconnect DB
    Disconnect From Database