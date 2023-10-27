*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin Web Test
    set selenium timeout    10s
    open browser            ${URL}    ${BROWSER}

End Web Test
    close browser