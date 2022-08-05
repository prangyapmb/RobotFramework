*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     Collections
Library     OperatingSystem
*** Test Cases ***
Navigate to All links of google
    Open Browser    https://opensource-demo.orangehrmlive.com/index.php/auth/login  chrome
    Sleep   2s
    @{element_list}=        Get WebElements     xpath=//a
    #Create Empty List String to store all href
    @{hrefList}=    Create List
    create file    TestData/test_file.txt
   FOR     ${link}  IN      @{element_list}
   # Search for Attribute which is having href to grab the link
        ${href}=    Get Element Attribute    ${link}        href
        Log to Console    ${href}
        #Append all grabbed href to List String
        Append To List  ${hrefList}  ${href}
        Append to file    TestData/test_file.txt    ${href}\n
   END
   # Run loop on top of Appended list to navigate each link
   FOR     ${href1}    IN      @{hrefList}
         GoTo       ${href1}
         Sleep   2s

   END
   close browser