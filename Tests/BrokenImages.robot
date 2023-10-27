*** Settings ***
Documentation               This is a testing exercise to test broken images on a web page.
Resource                    ../Resources/Common.robot
Resource                    ../Resources/TestingApp.robot
Test Setup                  Begin Web Test
Test Teardown               End Web Test

#Run:
#robot -d results/brokenimages  tests/brokenimages.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =                FireFox
${URL} =                    https://the-internet.herokuapp.com/broken_images
${VERIFY_LABEL} =           Broken Images
#Case by case *** variables ***
${IMAGE_BROKEN_CSS} =       css=#content > div > img:not([src^='img/'])
${IMAGE_AVAILABLE_CSS} =    css=#content > div > img[src^='img/']
${BROKEN_COUNT} =           2
${AVAILABLE_COUNT} =        1

*** Test Cases ***
Test if Pages Loads
    [Documentation]         To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Test Broken Images
    [Documentation]         Test to count and validate broken images.
    TestingApp.Validate an Image Link   ${IMAGE_BROKEN_CSS}    ${BROKEN_COUNT}

Test Available Images
    [Documentation]         Test to count and validate available images.
    TestingApp.Validate an Image Link   ${IMAGE_AVAILABLE_CSS}    ${AVAILABLE_COUNT}

*** Keywords ***

