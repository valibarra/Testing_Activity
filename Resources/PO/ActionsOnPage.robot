*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
Library    OperatingSystem
Library    Collections
Library    String

*** Variables ***

*** Keywords ***

Click on a Button
    [Arguments]    ${button}
    click button    ${button}

Verify Added Elements
    [Arguments]    ${ELEMENT_ID}    ${ELEMENT_NUMBER}
    ${element_count} =    get element count    ${ELEMENT_ID}
    should be equal as integers    ${element_count}     ${ELEMENT_NUMBER}

