*** Settings ***
Documentation  To validate the login form
Library  SeleniumLibrary
Library     Collections
Test Setup  Open the browser with mortgage payment url
Test Teardown   Close browser session
Resource  resource.robot

*** Variables ***
${Error_message_login}  css:.alert-danger    #Global variables
${shop_page_load}       css:.nav-link

*** Test Cases ***
Validate unsuccessful Login
   Fill the login form     ${user_name}    ${invalid_password}
   wait until element is located in the page      ${Error_message_login}
   verify error message is correct

Validate cards display in the shopping page
    Fill the login form     ${user_name}    ${valid_password}
    wait until element is located in the page       ${shop_page_load}
    Verify card titles in the shop page
    Select the Card     Nokia Edge

*** Keywords ***
Fill the login form
    [arguments]     ${user_name}    ${password}
    input text  id:username     ${user_name}
    input password  id:password     ${password}
    click button  signInBtn

wait until element is located in the page
    [arguments]     ${element}
    wait until element is visible   ${element}


verify error message is correct
    #${result}=  get text  ${Error_message_login}    #${result} -->Local variavle operates within verify error message is correct
    #should be equal as strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_message_login}  Incorrect username/password.


Verify card titles in the shop page
    @{expectedList} =   Create List     iphone X    Samsung Note 8  Nokia Edge  Blackberry
    ${elements} =   Get WebElements     css:.card-title
    @{actualList} =     Create List
    FOR     ${element}  IN  @{elements}
            Log     ${element.text}
            Append To List      ${actualList}   ${element.text}
    END
    Lists Should Be Equal   ${expectedList}     ${actualList}
#comment to check push to git

Select the Card
    [arguments]    ${cardName}
    ${elements}=    Get WebElements     css:.card-title
    #Log    ${elements.text}
    ${index}=       Set Variable     1
    FOR     ${element}  IN  @{elements}
        #Log     ${element.text}
        Exit For Loop If    '${cardName}'=='${element.text}'
        ${index}=   Evaluate   ${index} +1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button



