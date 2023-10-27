*** Settings ***
Documentation                   This is a testing exercise for the automation lesson.
Resource                        ../Resources/Common.robot
Resource                        ../Resources/TestingApp.robot
Test Setup                      Begin Web Test
Test Teardown                   End Web Test

#Run:
#robot -d results/dynamiccont  tests/dynamiccontent.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                    chrome
${URL} =                        https://the-internet.herokuapp.com/dynamic_content
${VERIFY_LABEL} =               Dynamic Content
#Case by case *** variables ***
@{PHOTO_NAMES}
${MAX_PHOTO_NUMBER} =           5
${COUNT_APPENDED_PHOTOS} =      0
${LINK_ONE} =                   css=#content > div:nth-child(1) > div.large-2.columns > img
${LINK_TWO} =                   css=#content > div:nth-child(4) > div.large-2.columns > img
${LINK_THREE} =                 css=#content > div:nth-child(7) > div.large-2.columns > img
${ELEMENT_TO_GET} =             src

*** Test Cases ***
Test if Pages Loads
    [Documentation]             To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Dynamic Content Test
    [Documentation]             Test to reload a page until all images are shown.
    FOR    ${i}    IN RANGE     50
        ${get_name1}    Get Element Attribute    ${LINK_ONE}    ${ELEMENT_TO_GET}
        Append Photo Name    ${get_name1}
        ${get_name2}    Get Element Attribute    ${LINK_TWO}    ${ELEMENT_TO_GET}
        Append Photo Name    ${get_name2}
        ${get_name3}    Get Element Attribute    ${LINK_THREE}    ${ELEMENT_TO_GET}
        Append Photo Name    ${get_name3}
        exit for loop if    '${COUNT_APPENDED_PHOTOS}' == '${MAX_PHOTO_NUMBER}'
        Reload Page
    END
    list should not contain duplicates    ${PHOTO_NAMES}

*** Keywords ***

Append Photo Name
    [Arguments]    ${name}
    Run Keyword If    '${name}' not in ${PHOTO_NAMES}    Append To Photos Names    ${name}

Append To Photos Names
    [Arguments]    ${name}    @{LIST}
    Append To List    ${PHOTO_NAMES}    ${name}
    ${pre} =   get length    ${PHOTO_NAMES}
    set global variable    ${COUNT_APPENDED_PHOTOS}    ${pre}

