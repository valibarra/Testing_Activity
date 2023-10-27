*** Settings ***
Documentation       Contains most common actions betweens the tests
Library             SeleniumLibrary
Library             Dialogs
Library             OperatingSystem
Library             Collections
Library             String

*** Variables ***

*** Keywords ***

Click on a Button
    [Arguments]    ${button}
    click button    ${button}

Verify Added or Removed Elements
    [Arguments]    ${element}    ${number}
    ${element_count} =    get element count    ${element}
    should be equal as integers    ${element_count}     ${number}

Validate Images
    [Arguments]    ${element}    ${count}
    ${element_count} =    get element count    ${element}
    should be equal as integers    ${element_count}    ${count}

Select A Checkbox
    [Arguments]    ${checkbox}
    select checkbox    ${checkbox}

Validate Checkbox Selection
    [Arguments]    ${checkbox}
    checkbox should be selected    ${checkbox}

Validate Two Checkboxes Selection
    [Arguments]    ${checkbox_1}    ${checkbox_2}
    checkbox should be selected    ${checkbox_1}
    checkbox should be selected    ${checkbox_2}

Open a context Menu
    [Arguments]    ${box_xpath}
    open context menu    ${box_xpath}

Validate Alert is Present
    [Arguments]    ${alert}
    alert should be present    ${alert}   LEAVE

Accept Handle Alert
    handle alert    accept    1s

Validate Alert is not Present
    alert should not be present    DISMISS    4S

Click on an Element
    [Arguments]    ${element}
    click element    ${element}

Reload Page for Buttons
    [Arguments]    ${range}    ${path}    ${m_number}
    FOR    ${i}    IN RANGE    ${range}
        reload page
        ${message} =    get element count    ${path}
        log    ${message}
        run keyword if    '${message}' == '${m_number}'     exit for loop
    END

Drag And Drop Elements
    [Arguments]    ${element_1}    ${element_2}
    drag and drop    ${element_1}    ${element_2}

Validate Drag And Drop
    [Arguments]    ${element}   ${valid}
    ${text} =    get text  ${element}
    should be equal as strings    ${text}    ${valid}

Validate Element is not Contained
    [Arguments]    ${element}    ${time}
    wait until element does not contain    ${element}        log    ${time}

Verify Downloaded Files
    [Arguments]    ${down_directory}    @{down_files}
    ${downloaded_files_on_pc} =    List Files In Directory    ${down_directory}
    FOR    ${expected_file}    IN    @{down_files}
        ${file_found} =    Run Keyword And Return Status    File Found Case Insensitive    ${down_directory}    ${expected_file}
        Run Keyword If    not ${file_found}    Fail    File '${expected_file}' not found in the download directory (case-insensitive)
    END

Get Filename From URL
    [Arguments]    ${url}
    ${url_with_spaces} =    Replace String    ${url}    %20    ${SPACE}
    ${path_parts} =    Evaluate    '${url_with_spaces}'.split('/')
    [Return]    ${path_parts[-1]}

File Found Case Insensitive
    [Arguments]    ${directory}    ${filename}
    ${filename} =    Evaluate    urllib.parse.unquote("${filename}")
    ${found} =    Evaluate    any(i.lower() == '${filename}'.lower() for i in os.listdir('${directory}'))
    should be true    ${found}
    [Return]    ${found}

Move Out Mouse
    [Arguments]    ${locator}
    mouse over     ${locator}
    mouse out      ${locator}

Validate Page Contains Element
    [Arguments]    ${location}
    Wait Until Page Contains Element     ${location}

Create a Text File
    [Arguments]    ${text}    ${name}
    ${user_directory} =    Get User Directory
    ${text_to_write} =    Set Variable    ${text}
    Create File    ${user_directory}/${name}    content=${text_to_write}

Get User Directory
    [Documentation]    Get the user home directory
    ${user_directory} =    Evaluate    os.path.expanduser("~")
    [Return]    ${user_directory}

The Page Should Contain
    [Arguments]    ${element}
    page should contain    ${element}

Input User and Password
    [Arguments]    ${location_user}    ${text_user}    ${location_pass}    ${text_pass}    ${button}    ${message}
    input text    ${location_user}    ${text_user}
    input text    ${location_pass}    ${text_pass}
    click on a button    ${button}
    the page should contain    ${message}

Click on a Link
    [Arguments]    ${element}
    click link    ${element}




