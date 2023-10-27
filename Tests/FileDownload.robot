*** Settings ***
Documentation               This is a testing exercise to test download for files.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/filedown  tests/filedownload.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                ff
${URL} =                    https://the-internet.herokuapp.com/download
${VERIFY_LABEL} =           File Downloader
#Case by case *** variables ***
@{DOWNLOADED_FILES}
@{LINKS_TO_DOWNLOAD}
@{HREF_LINKS}
${DOWNLOAD_DIRECTORY} =     C:/Users/Vdibarra/Downloads
${HREF_CSS} =               css=a[href^='download/']


*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

File Download Test
    [Documentation]         Test for download files and verify if the download was successful.
    @{LINKS_TO_DOWNLOAD}    Get WebElements    ${HREF_CSS}
    FOR  ${element}  IN  @{LINKS_TO_DOWNLOAD}
        ${href} =    Get Element Attribute    ${element}    href
        ${filename} =    TestingApp.Get Filename From URL    ${href}
        TestingApp.Click on an Element    ${element}
        Append To List    ${DOWNLOADED_FILES}    ${filename}
    END
    TestingApp.Verify Downloaded Files    ${DOWNLOAD_DIRECTORY}    @{DOWNLOADED_FILES}

*** Keywords ***


