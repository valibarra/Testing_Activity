*** Settings ***
Documentation           This is a testing exercise to switch to a different window.
Resource                ../Resources/Common.robot
Resource                ../Resources/TestingApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

#Run:
#robot -d results/multiplewindows  tests/multiplewindows.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =            chrome
${URL} =                https://the-internet.herokuapp.com/windows
${VERIFY_LABEL} =       Opening a new window
#Case by case *** variables ***
${LINK_SELECTOR} =      css=#content > div > a
${SLEEP_TIME} =         3s
${OTHER_WINDOW_NAME} =    New Window

*** Test Cases ***
Test if Pages Loads
    [Documentation]     To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Multiple Windows Test
    [Documentation]     Test to try to switch to another window.
    TestingApp.Click on a Link    ${LINK_SELECTOR}
    sleep    3s
    switch window    title=${OTHER_WINDOW_NAME}
    sleep    3s
    TestingApp.The Page Should Contain    ${OTHER_WINDOW_NAME}

*** Keywords ***
