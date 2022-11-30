*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${user_name}    rahulshettyacademy
${invalid_password}     12345678
${valid_password}       learning
${url}   https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the browser with mortgage payment url
    #OPEN BROWSER  https://rahulshettyacademy.com/loginpagePractise/     chrome
    create webdriver  Chrome    executable_path=C:\Users\RACH1084\Downloads\chromedriver_win32\chromedriver
    go to  ${url}

Close browser session
    Close Browser