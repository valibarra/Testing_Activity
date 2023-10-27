*** Settings ***
Documentation           This is a testing exercise to try to press different keys on a web page.
Resource                ../Resources/Common.robot
Resource                ../Resources/TestingApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

#Run:
#robot -d results/keypresses  tests/keypresses.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =            chrome
${URL} =                https://the-internet.herokuapp.com/key_presses
${VERIFY_LABEL} =       Key Presses
#Case by case *** variables ***
${ELEMENT_LOCATOR} =    css=#target
${SPACE_ASCII} =        \\32
${ESC_ASCII} =          \\27
${ESC_MESSAGE} =        You entered: ESCAPE
${SPACE_MESSAGE} =      You entered: SPACE
${SLEEP_TIME} =         3S

*** Test Cases ***
Test if Pages Loads
    [Documentation]     To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Key Presses Test
    [Documentation]     Test to try press different keys using automatization.
    TestingApp.Click on an Element    ${ELEMENT_LOCATOR}
    press key          ${ELEMENT_LOCATOR}    ${ESC_ASCII}
    page should contain    ${ESC_MESSAGE}
    SLEEP    ${SLEEP_TIME}
    press key    ${ELEMENT_LOCATOR}    ${SPACE_ASCII}
    page should contain    ${SPACE_MESSAGE}
    SLEEP    ${SLEEP_TIME}

*** Keywords ***
