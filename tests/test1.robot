*** Settings ***
Documentation  To validate the login form
Library  SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${Error_message_login}  css:.alert-danger    #Global variables

*** Test Cases ***
Validate unsuccessful Login
    Open the browser with mortgage payment url
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
Open the browser with mortgage payment url
    #OPEN BROWSER  https://rahulshettyacademy.com/loginpagePractise/     chrome
    create webdriver  Chrome    executable_path=C:\Users\RACH1084\Downloads\chromedriver_win32\chromedriver
    go to  https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    input text  id:username   rahulshettyacademy
    input password  id:password   12345678
    click button  signInBtn

wait until it checks and display error message
    wait until element is visible   ${Error_message_login}


verify error message is correct
    #${result}=  get text  ${Error_message_login}    #${result} -->Local variavle operates within verify error message is correct
    #should be equal as strings  ${result}   Incorrect username/password.
    Element Text Should Be  ${Error_message_login}  Incorrect username/password.




