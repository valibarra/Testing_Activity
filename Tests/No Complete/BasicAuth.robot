*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Documentation    This is a testing exercise for the automation lesson.

#Run:
#robot -d results  tests/basicauth.robot
*** Variables ***
${BROWSER} =    chrome
${URL} =    https://the-internet.herokuapp.com/basic_auth
${VERIFY_LABEL} =    Broken Images

*** Test Cases ***
Broken Images Tests
    Begin Web Test
    #sleep    3s
    input text into alert    admin    leave
    input text into alert    admin    accept    1s
    page should contain    Congratulations! You must have the proper credentials.
    End Web Test
    Begin Web Test
    sleep    3s
    input text into alert    admin1    leave    1s
    input text into alert    admin    accept    1s
    ${message} =	Handle Alert    dismiss
    page should contain    Not authorized

*** Keywords ***
Begin Web Test
    set selenium timeout    10s
    open browser    ${URL}    ${BROWSER}

Verify Page Loaded
    wait until page contains    ${VERIFY_LABEL}


End Web Test
    close browser