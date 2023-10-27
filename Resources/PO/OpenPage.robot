*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Navigate To
    go to                       ${URL}

Verify Page Loaded
    wait until page contains    ${VERIFY_LABEL}
