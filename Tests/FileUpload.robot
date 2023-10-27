*** Settings ***
Documentation               This is a testing exercise to try to upload a file on a web page.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/fileup  tests/fileupload.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                chrome
${URL} =                    https://the-internet.herokuapp.com/upload
${VERIFY_LABEL} =           File Uploader
#Case by case *** variables ***
${TEXT_TO_FILE} =           testing
${FILE_NAME} =              test.txt
${FILE_CHOOSER} =           css=#file-upload
${ELEMENT_TO_CLICK} =       css=#file-submit
${VALIDATE_MESSAGE} =       File Uploaded!

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

File Upload Test
    [Documentation]         Test to try to upload a file.
    TestingApp.Create a Text File    ${TEXT_TO_FILE}    ${FILE_NAME}
    ${user_directory} =    TestingApp.Get User Directory
    Choose File    ${FILE_CHOOSER}    ${user_directory}\\${FILE_NAME}
    TestingApp.Click on an Element    ${ELEMENT_TO_CLICK}
    TestingApp.The Page Should Contain    ${VALIDATE_MESSAGE}

*** Keywords ***
