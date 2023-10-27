*** Settings ***
Documentation               This is a testing exercise to test a floting menu on a web page.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/floatingmenu  tests/floatingmenu.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                chrome
${URL} =                    https://the-internet.herokuapp.com/floating_menu
${VERIFY_LABEL} =           Floating Menu
#Case by case *** variables ***
${FLOATING_MENU_XPATH} =    xpath=//*[@id="menu"]
${JS_COMMAND} =             window.scrollTo(0, document.body.scrollHeight)

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Floating Menu Test
    [Documentation]         To test if a floating menu stays after scrolling down a page.
    Execute JavaScript    ${JS_COMMAND}
    TestingApp.Validate Page Contains Element    ${FLOATING_MENU_XPATH}

*** Keywords ***

