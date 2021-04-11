*** Settings ***
Suite Teardown    close browser
Test Teardown
Library           DatabaseLibrary
Resource          FlightApplicationKeywords.txt
Library           Collections
Library           String
Resource          DatabaseKeywords.txt

*** Variables ***
${count}          ${EMPTY}
@{queryResult}

*** Test Cases ***
TC01_DemoDatabase
    Connect To Database    pymssql    testdb    testuser    testuser    localhost    1433
    Table Must Exist    USERS
    ${queryresult}    Description    select * from USERS
    Log Many    ${queryresult}
    ${queryresult}    Query    select * from USERS
    Log Many    ${queryresult}
    ${count}    Row Count    select * from USERS
    log    ${count}
    Row Count Is Equal To X    select * from USERS    5
    Check If Exists In Database    select LastName from USERS where FirstName='Devyani'
    Check If Not Exists In Database    select * from USERS where LastName='123'

TC02_LoginFromDB
    Connect To Database    pymssql    testdb    testuser    testuser    localhost    1433
    Table Must Exist    LOGIN
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${result}    GetValueBasedOnID    Username    2
    EnterLoginID    ${result}
    ${result}    GetValueBasedOnID    Password    2
    EnterPassword    ${result}
    SignIn
    ${result}    VerifyInvalidLoginMsg
    InsertValueBasedOnID    ${result}    2
