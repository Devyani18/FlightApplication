*** Settings ***
Library           SeleniumLibrary
Library           ExcelRobot
Resource          UserDefinedKeywords.txt    # First Resource File
Library           DateTime

*** Variables ***
${DemoVariable}    4    # First scaler variable
${DemoVar2}       4    # Variable to be compared
@{USER}           Devyani    Muktai    # List
&{credentials}    username=devyani    password=devyani    # First Dict

*** Test Cases ***
DemoTestcase
    [Documentation]    This is my first test case. It is used to compare two variables.
    ...    Name - *DemoTestCase*
    ...    Auther - _Devyani_
    ...    Documentation - https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    [Setup]    SetupDemo
    Should Be Equal    ${DemoVariable}    ${DemoVar2}
    CompareTwoVariables
    DateTime.Get Current Date
    Log To Console    Hello World
    [Teardown]    TeardownDemo

DemoTest2
    [Tags]    LOGIN
    Should Not Be Equal As Strings    ${user}[0]    ${user}[1]
    Should Be Equal As Integers

DemoDict
    Should Be Equal As Strings    ${credentials}[username]    ${credentials}[password]

DemoTextEdit
    [Tags]    LOGIN
    Should Be True    4    4

TemplateDemo
    [Template]    Should Be Equal As Integers    # Demo Template
    4    4
    7    7
    1    1
    102    102

*** Keywords ***
SetupDemo
    Log To Console    This is setup method

TeardownDemo
    Log To Console    This is teardown
