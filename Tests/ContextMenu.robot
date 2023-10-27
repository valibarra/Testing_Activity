*** Settings ***
Documentation               This is a testing exercise to test the context menu.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/contextmenu  tests/contextmenu.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                chrome
${URL} =                    https://the-internet.herokuapp.com/context_menu
${VERIFY_LABEL} =           Context Menu
#Case by case *** variables ***
${BOX_ID} =                 xpath=//*[@id="hot-spot"]
${ALERT_LABEL} =            You selected a context menu

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Context Menu Test
    [Documentation]         Test to validate alerts from a context menu.
    TestingApp.Open a context Menu    ${BOX_ID}
    TestingApp.Validate Alert is Present     ${ALERT_LABEL}
    TestingApp.Accept Handle Alert
    TestingApp.Validate Alert is not Present

*** Keywords ***
