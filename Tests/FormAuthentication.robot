*** Settings ***
Documentation                           This is a testing exercise for the automation lesson.
Resource                                ../Resources/Common.robot
Resource                                ../Resources/TestingApp.robot
Test Setup                              Begin Web Test
Test Teardown                           End Web Test

#Run:
#robot -d results/formauth  tests/formauthentication.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                            chrome
${URL} =                                https://the-internet.herokuapp.com/login
${VERIFY_LABEL} =                       Login Page
#Case by case *** variables ***
${VALID_USER_ID} =                      tomsmith
${INVALID_USER_ID} =                    tomsmith1
${VALID_PASSWORD} =                     SuperSecretPassword!
${INVALID_PASSWORD} =                   SuperS1ecretPassword!
${USER_XPATH} =                         xpath=//*[@id="username"]
${PASSWORD_XPATH} =                     xpath=//*[@id="password"]
${BUTTON_XPATH} =                       xpath=//*[@id="login"]/button
${MESSAGE_VALIDATION_INVALID_PASS} =    Your password is invalid!
${MESSAGE_VALIDATION_INVALID_USER} =    Your username is invalid!
${MESSAGE_VALIDATION_LOGIN} =           You logged into a secure area!
${MESSAGE_VALIDATION_LOGOUT} =          You logged out of the secure area!
${LOGOUT_LINK} =                        xpath=//*[@id="content"]/div/a

*** Test Cases ***
Test if Pages Loads
    [Documentation]                     To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Form Auth Test
    [Documentation]                     Test to try a form authentication on a web page.
    TestingApp.Input User and Password       ${USER_XPATH}    ${VALID_USER_ID}    ${PASSWORD_XPATH}   ${VALID_PASSWORD}    ${BUTTON_XPATH}    ${MESSAGE_VALIDATION_LOGIN}
    TestingApp.Click on a Link               ${LOGOUT_LINK}
    TestingApp.The Page Should Contain       ${MESSAGE_VALIDATION_LOGOUT}
    TestingApp.Input User and Password       ${USER_XPATH}    ${INVALID_USER_ID}    ${PASSWORD_XPATH}   ${VALID_PASSWORD}    ${BUTTON_XPATH}    ${MESSAGE_VALIDATION_INVALID_USER}
    TestingApp.Input User and Password       ${USER_XPATH}    ${VALID_USER_ID}    ${PASSWORD_XPATH}   ${INVALID_PASSWORD}    ${BUTTON_XPATH}    ${MESSAGE_VALIDATION_INVALID_PASS}

*** Keywords ***
