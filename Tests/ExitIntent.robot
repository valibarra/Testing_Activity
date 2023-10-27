*** Settings ***
Documentation               This is a testing exercise for mouse out elements.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/exitintent  tests/exitintent.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                chrome
${URL} =                    https://the-internet.herokuapp.com/exit_intent
${VERIFY_LABEL} =           Exit Intent
#Case by case *** variables ***
${MODAL_LOCATOR} =          css=#ouibounce-modal > div.modal
${ELEMENT_LOCATOR} =        css=#content > div.example > h3

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Exit Intent Test
    [Documentation]         To test mouse out on a page.
    TestingApp.Move Out Mouse    ${ELEMENT_LOCATOR}
    TestingApp.Validate Page Contains Element    ${MODAL_LOCATOR}

*** Keywords ***
