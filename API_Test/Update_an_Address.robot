*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
Library     Collections
Library     OperatingSystem
Library     ../Resources/UserKeywords.py
*** Variables ***
${base_url}     https://demo.spreecommerce.org

*** Test Cases ***
Create an Address
    # Calling user Defined keyword implemented in python , which is defined under resource folder.
    ${response}=       Get Token
    ${access_token}=      get value from json   ${response}        $.access_token
    ${token}=      Set Variable    ${access_token[0]}
    Log to console   ${token}
    create session      mysession   ${base_url}
    #log to console      ${token}
    ${headers}      create dictionary    Authorization=Bearer ${token}       Content-Type=application/json
    log to console      ${headers}
    ${req_body}=    get file    API_Test/TestData/CreateAddress.json
    log to console      ${req_body}
    ${json_body}=   convert string to json      ${req_body}

    #get address first to update
    ${response}=        GET On Session      mysession       /api/v2/storefront/account/addresses
    ${id}=      get value from json  ${response.json()}        $.data.id

    #update address
    ${response}=    patch on session         mysession       /api/v2/storefront/account/addresses/{id}      json=${json_body}        headers=${headers}
    log to console      ${response.status_code}
    ${response_body}=      To Json     ${response.content}     pretty_print = True
    Log to console     ${response_body}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal    ${status_code}       200
    log to console      ${status_code}
    #Check token from Response Body
    ${fname}=      get value from json  ${response.json()}        $.data.attributes.firstname
    #extract the contents of the string out of the query results , to remove unicode
    # Need to use [0]
    Log to console      ${fname[0]}
    ${fname}=      Set Variable    ${fname[0]}
    Should be equal     ${fname}    Robot
    Set Global Variable   ${fname}
    ${id}=      get value from json  ${response.json()}        $.data.id

    ${id_final}=      Set Variable    ${id[0]}
    Log to console   ${id_final}