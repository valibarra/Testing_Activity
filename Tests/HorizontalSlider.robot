*** Settings ***
Documentation           This is a testing exercise to test an slider on a web page.
Resource                ../Resources/Common.robot
Resource                ../Resources/TestingApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

#Run:
#robot -d results/hslider  tests/horizontalslider.robot

*** Variables ***
#Constant *** variables ***
${BROWSER} =            chrome
${URL} =                https://the-internet.herokuapp.com/horizontal_slider
${VERIFY_LABEL} =       Horizontal Slider
#Case by case *** variables ***
${SLIDER_XPATH} =       xpath=//*[@id="range"]
${JS_CODE} =            showValue(3.5)
${COMPARE_VALUE} =      3.5

*** Test Cases ***
Test if Pages Loads
    [Documentation]     To test if the page works correclty.
    TestingApp.Navigate to Page
    TestingApp.Verify Page Loaded

Horizontal Slider Test
    [Documentation]     Test to try to change a slider and validate it.
    Execute JavaScript  ${JS_CODE}
    ${value} =    Get Text    ${SLIDER_XPATH}
    Should Be Equal As Strings    ${value}    ${COMPARE_VALUE}

*** Keywords ***

