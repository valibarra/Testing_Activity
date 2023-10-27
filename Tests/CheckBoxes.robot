*** Settings ***
Documentation               This is a testing exercise to test checkboxes selection.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test


#Run:
#robot -d results/checkboxes  tests/checkboxes.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                chrome
${URL} =                    https://the-internet.herokuapp.com/checkboxes
${VERIFY_LABEL} =           Checkboxes
#Case by case *** variables ***
${CHECKBOX_XPATH1} =        xpath=//*[@id="checkboxes"]/input[1]
${CHECKBOX_XPATH2} =        xpath=//*[@id="checkboxes"]/input[2]

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Checkboxes test
    [Documentation]         Test to select and verify checkboxes.
    TestingApp.Select a Checkbox    ${CHECKBOX_XPATH1}
    TestingApp.Validate a checkbox selection    ${CHECKBOX_XPATH1}
    TestingApp.Select a Checkbox    ${CHECKBOX_XPATH2}
    TestingApp.Validate Checkboxes Selection    ${CHECKBOX_XPATH1}    ${CHECKBOX_XPATH2}

*** Keywords ***
