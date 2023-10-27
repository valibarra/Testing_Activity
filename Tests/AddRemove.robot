*** Settings ***
Documentation           This is a testing excercise to add and remove elements from a web page.
Resource                ../Resources/Common.robot
Resource                ../Resources/TestingApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

#Run:
#robot -d results/addremove  tests/addremove.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                   FireFox
${URL} =                       https://the-internet.herokuapp.com/add_remove_elements/
${VERIFY_LABEL} =              Add/Remove Elements
#Case by case *** variables ***
${ELEMENT_TO_COUNT_ID} =       //*[@id="elements"]/button
${ELEMENT_NUMBER_ADDED} =      20
${ELEMENT_NUMBER_REMOVED} =    0
${ADD_ELEMENT} =               Add Element
${DELETE_ELEMENT} =            Delete

*** Test Cases ***
Test if Pages Loads
    [Documentation]            To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Test to add and Remove Elements
    [Documentation]            Test to add and remove 20 elements and verifies the action.
    FOR    ${i}    IN RANGE    20
        TestingApp.Click on a Button    ${ADD_ELEMENT}
    END
    TestingApp.Verify Elements Added or Removed    ${ELEMENT_TO_COUNT_ID}    ${ELEMENT_NUMBER_ADDED}
    FOR    ${i}    IN RANGE    20
        TestingApp.Click on a Button    ${DELETE_ELEMENT}
    END
    TestingApp.Verify Elements Added or Removed    ${ELEMENT_TO_COUNT_ID}    ${ELEMENT_NUMBER_REMOVED}

*** Keywords ***
