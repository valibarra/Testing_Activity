*** Settings ***
Documentation               This is a testing exercise to verify elements on a page after interact with it.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/dynamiccontrol  tests/dynamiccontrols.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                chrome
${URL} =                    https://the-internet.herokuapp.com/dynamic_controls
${VERIFY_LABEL} =           Dynamic Controls
#Case by case *** variables ***
${BUTTON_1} =               Remove    #checkbox-example > button
${BUTTON_2} =               Enable    #input-example > button
${ELEMENT_CHECKBOX} =       css=#checkbox
${ELEMENT_INPUT} =          css=input[disabled]
${SET_TIME} =               15s

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Dynamic Controls Test
    [Documentation]         Test to verify elements after interact with buttons.
    TestingApp.Click on a Button    ${BUTTON_1}
    TestingApp.Validate Element is not Contained    ${ELEMENT_CHECKBOX}    ${SET_TIME}
    TestingApp.Click on a Button    ${BUTTON_2}
    TestingApp.Validate Element is not Contained    ${ELEMENT_INPUT}    ${SET_TIME}

*** Keywords ***

