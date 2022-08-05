*** Settings ***
Documentation    Suite description
Library  ../Resources/Read_Excel_File.py

*** Variables ***
${EXCEL_FILE_PATH}      C:\\Users\\adixit\\PycharmProjects\\RobotFramework\\TestData\\OrangeData.xlsx
${EXCEL_SHEET_NAME}     Order
*** Test Cases ***
Collect orders info
    ${orders}=    Get Orders        ${EXCEL_FILE_PATH}      ${EXCEL_SHEET_NAME}
    Log to Console    ${orders}