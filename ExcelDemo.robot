*** Settings ***
Library           ExcelRobot
Library           Collections
Library           SeleniumLibrary
Resource          CommonKeywords.txt
Resource          FlightApplicationKeywords.txt

*** Variables ***
${columnCount}    ${EMPTY}
${value}          ${EMPTY}
${i}              ${EMPTY}
${yesvar}         Yes
@{output}
${execute}        ${EMPTY}
${rowcount}       ${EMPTY}
${testcase}       ${EMPTY}
${LoginMessage}    ${EMPTY}

*** Test Cases ***
ReadExcelDemo
    Open Excel    D:/Study/Automation/ExcelData/excelDemo.xls
    ${columnCount}    Get Column Count    excelDemo
    @{columnVal}    Get Column Values    excelDemo    2
    FOR    ${value}    IN    @{columnVal}
        LOG    ${value}
    END
    ${value}    Get Sheet Names
    ${value}    Get Row Count    excelDemo
    @{columnVal}    Get Row Values    excelDemo    4
    ${value}    Read Cell Data    excelDemo    2    2
    ${value}    Read Cell Data By Name    excelDemo    C5

WriteExcelDemo
    Open Excel To Write    D:/Study/Automation/ExcelData/excelDemo.xls
    Write To Cell By Name    excelDemo    A13    DemoWrite
    Save Excel

Assignment7
    Open Excel    ExcelAssignment1.xls
    ${rowcount}    Get Row Count    Sheet1
    FOR    ${i}    IN RANGE    1    ${rowcount}
        ${testcase}    Read Cell Data    Sheet1    0    ${i}
        ${execute}    Read Cell Data    Sheet1    1    ${i}
        Run Keyword And Continue On Failure    Run Keyword If    '${execute}'=='Yes'    Append To List    ${output}    ${testcase}
    END
    Log    Executable testcases :
    Log    ${output}

Assignment8
    Wait Until Keyword Succeeds    2 min    5 sec    Open Browser    https://ngendigital.com/demo-application    chrome
    Select Frame    id=iframe-010
    Wait Until Keyword Succeeds    2 min    5 sec    LoginFlightApplication
    ${LoginMessage}    Get Text    css:#InvalidLogin label
    Open Excel    excelDemo.xls
    ${expectedMsg}    Read Cell Data    excelDemo    6    1
    Should Be Equal As Strings    ${expectedMsg}    ${LoginMessage}
    [Teardown]    close browser

DemoGetDataFromExcel
    GetDataFromExcel    excelDemo.xls    excelDemo    TC04    email
