*** Settings ***
Documentation           This is a testing exercise to test how to navigate on a JQuery menu.
Resource                ../Resources/Common.robot
Resource                ../Resources/TestingApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

#Run:
#robot -d results/jqmenu  tests/jqueryuimenus.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =            chrome
${URL} =                https://the-internet.herokuapp.com/jqueryui/menu
${VERIFY_LABEL} =       JQueryUI - Menu
#Case by case *** variables ***
@{DOWNLOADED_FILES}
@{LINKS_TO_DOWNLOAD}
@{HREF_LINKS}
${DOWNLOAD_DIRECTORY} =    C:/Users/Vdibarra/Downloads
${ELEMENT_MENU_1} =     css=#ui-id-3 > a
${ELEMENT_MENU_2} =     css=#ui-id-4 > a
${ELEMENT_EXCEL} =      css=#ui-id-7 > a
${SLEEP_TIME} =         1S


*** Test Cases ***
Test if Pages Loads
    [Documentation]     To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

JQuery Menu Test
    [Documentation]    Test movement on a JQuery menu.
    mouse over    ${ELEMENT_MENU_1}
    sleep    ${SLEEP_TIME}
    mouse over    ${ELEMENT_MENU_2}
    sleep    ${SLEEP_TIME}
    mouse over    ${ELEMENT_EXCEL}
    sleep    ${SLEEP_TIME}
    ${href} =    Get Element Attribute    ${ELEMENT_EXCEL}    href
    ${filename} =    TestingApp.Get Filename From URL    ${href}
    TestingApp.Click on a Link    ${ELEMENT_EXCEL}
    sleep    ${SLEEP_TIME}
    Append To List    ${downloaded_files}    ${filename}
    TestingApp.Verify Downloaded Files    ${DOWNLOAD_DIRECTORY}    @{DOWNLOADED_FILES}

*** Keywords ***
