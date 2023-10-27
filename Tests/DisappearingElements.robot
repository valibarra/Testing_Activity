*** Settings ***
Documentation               This is a testing exercise to reload a page for dissapearing elements.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/disappearingelements  tests/DisappearingElements.robot
*** Variables ***
#Constant *** variables ***
${BROWSER} =                chrome
${URL} =                    https://the-internet.herokuapp.com/disappearing_elements
${VERIFY_LABEL} =           Disappearing Elements
#Case by case *** variables ***
${BUTTON_XPATH} =           xpath=//*[@id="content"]/div/ul/li[5]/a
${EXIT_MESSAGE_1} =         1
${EXIT_MESSAGE_2} =         0
${RANGE} =                  10

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Disappearing Elements Test
    [Documentation]         Test to realod the page to shown a button and then to dissapear the button.
    TestingApp.Reload Page for Button    ${RANGE}    ${BUTTON_XPATH}    ${EXIT_MESSAGE_1}
    TestingApp.Reload Page for Button    ${RANGE}    ${BUTTON_XPATH}    ${EXIT_MESSAGE_2}

*** Keywords ***

