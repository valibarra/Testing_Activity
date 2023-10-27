*** Settings ***
Documentation           This is a testing exercise to test javascript alerts.
Resource                ../Resources/Common.robot
Resource                ../Resources/TestingApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

#Run:
#robot -d results/jsalerts  tests/javascriptalerts.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =            chrome
${URL} =                https://the-internet.herokuapp.com/javascript_alerts
${VERIFY_LABEL} =       JavaScript Alerts
#Case by case *** variables ***
${BUTTON_ALERT} =       css=#content > div > ul > li:nth-child(1) > button
${BUTTON_PROMP} =       css=#content > div > ul > li:nth-child(3) > button
${SLEEP_TIME} =         3s
${TEXT_TO_ALERT} =      testing
${VALIDATE_MESSAGE_1} =    You successfully clicked an alert
${VALIDATE_MESSAGE_2} =    You entered: testing

*** Test Cases ***
Test if Pages Loads
    [Documentation]     To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

JS Alerts Test
    [Documentation]    Test to interact with javascript alerts.
    TestingApp.Click on a Button    ${BUTTON_ALERT}
    sleep    ${SLEEP_TIME}
    TestingApp.accept handle alert
    TestingApp.The Page Should Contain    ${VALIDATE_MESSAGE_1}
    TestingApp.click on a button    ${BUTTON_PROMP}
    sleep    ${SLEEP_TIME}
    Input Text Into Alert    ${TEXT_TO_ALERT}    ACCEPT    ${SLEEP_TIME}
    TestingApp.The Page Should Contain    ${VALIDATE_MESSAGE_2}
    sleep    ${SLEEP_TIME}

*** Keywords ***
