*** Settings ***
Documentation    Control of the most common actions between pages.
Resource    ../Resources/PO/OpenPage.robot
Resource    ../Resources/PO/ActionsOnPage.robot
Resource    ../Resources/PO/PageActions.robot
*** Variables ***

*** Keywords ***

Navigate to Page
    OpenPage.Navigate To

Verify Page Loaded
    OpenPage.Verify Page Loaded

Click on a Button
    [Arguments]    ${button}
    PageActions.Click on a Button    ${button}

Verify Elements Added or Removed
    [Arguments]    ${element}    ${number}
    PageActions.Verify Added or Removed Elements    ${element}    ${number}

Validate an Image Link
    [Arguments]    ${element}    ${count}
    PageActions.Validate Images    ${element}    ${count}

Select a Checkbox
    [Arguments]    ${checkbox}
    PageActions.Select A Checkbox    ${checkbox}

Validate a checkbox selection
    [Arguments]    ${checkbox}
    PageActions.Validate Checkbox Selection   ${checkbox}
Validate Checkboxes Selection
    [Arguments]    ${checkbox}    ${checkbox}
    PageActions.Validate Two Checkboxes Selection   ${checkbox}    ${checkbox}

Open a context Menu
    [Arguments]    ${box_xpath}
    PageActions.Open a context Menu    ${box_xpath}

Validate Alert is Present
    [Arguments]    ${alert}
    PageActions.Validate Alert is Present    ${alert}

Accept Handle Alert
    PageActions.Accept Handle Alert

Validate Alert is not Present
    PageActions.Validate Alert is not Present

Click on an Element
    [Arguments]    ${element}
    PageActions.Click on an Element    ${element}

Reload Page for Button
    [Arguments]    ${range}    ${path}    ${m_number}
    PageActions.Reload Page for Buttons    ${range}    ${path}    ${m_number}

Drag And Drop Elements
    [Arguments]    ${element_1}    ${element_2}
    PageActions.Drag And Drop Elements    ${element_1}    ${element_2}

Validate Drag And Drop
    [Arguments]    ${element}   ${valid}
    PageActions.Validate Drag And Drop    ${element}   ${valid}

Validate Element is not Contained
    [Arguments]    ${element}    ${time}
    PageActions.Validate Element is not Contained    ${element}    ${time}

Verify Downloaded Files
    [Arguments]    ${down_directory}    @{down_files}
    PageActions.Verify Downloaded Files    ${down_directory}    @{down_files}

Get Filename From URL
    [Arguments]    ${url}
    ${name} =    PageActions.Get Filename From URL    ${url}
    [Return]    ${name}

File Found Case Insensitive
    [Arguments]    ${directory}    ${filename}
    ${found} =    PageActions.File Found Case Insensitive    ${directory}    ${filename}
    [Return]    ${found}

Move Out Mouse
    [Arguments]    ${locator}
    PageActions.Move Out Mouse    ${locator}

Validate Page Contains Element
    [Arguments]    ${location}
    PageActions.Validate Page Contains Element    ${location}

Create a Text File
    [Arguments]    ${text}    ${name}
    PageActions.Create a Text File    ${text}    ${name}

Get User Directory
    ${user_directory} =    PageActions.Get User Directory
    [Return]    ${user_directory}

The Page Should Contain
    [Arguments]    ${element}
    PageActions.The Page Should Contain    ${element}

Input User and Password
    [Arguments]    ${location_user}    ${text_user}    ${location_pass}    ${text_pass}    ${button}    ${message}
    PageActions.Input User and Password    ${location_user}    ${text_user}    ${location_pass}    ${text_pass}    ${button}    ${message}

Click on a Link
    [Arguments]    ${element}
    PageActions.Click on a Link    ${element}



