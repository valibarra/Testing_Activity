*** Settings ***
Documentation               This is a testing exercise for drag and drop elements on a web page.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/dragdrop  tests/dragdrop.robot
*** Variables ***
#Constant *** variables ***
${BROWSER} =                chrome
${URL} =                    https://the-internet.herokuapp.com/drag_and_drop
${VERIFY_LABEL} =           Drag and Drop
#Case by case *** variables ***
${ELEMENT_DD_1} =           xpath=//*[@id="column-a"]
${ELEMENT_DD_2} =           xpath=//*[@id="column-b"]
${VALIDATE_TEXT_1} =        A
${VALIDATE_TEXT_2} =        B

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Drag and Drop Test
    [Documentation]         Test to drag and drop elements on a web page.
    TestingApp.Drag And Drop Elements    ${ELEMENT_DD_1}    ${ELEMENT_DD_2}
    TestingApp.Validate Drag And Drop    ${ELEMENT_DD_2}    ${validate_text_1}
    set selenium timeout    10s
    TestingApp.Drag And Drop Elements    ${ELEMENT_DD_2}    ${ELEMENT_DD_1}
    TestingApp.Validate Drag And Drop    ${ELEMENT_DD_2}    ${VALIDATE_TEXT_2}

*** Keywords ***

