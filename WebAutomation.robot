*** Settings ***
Suite Teardown
Library           SeleniumLibrary
Resource          CommonKeywords.txt    # Commonlu Used Keywords Resource File

*** Variables ***
@{cities}
${city}           ${EMPTY}
${Text}           ${EMPTY}
${row}            ${EMPTY}
@{rows}

*** Test Cases ***
OpenBrowser
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-010
    Input Text    name=FirstName    Devyani
    Element Text Should Be
    [Teardown]    close browser

WebElementsDemo
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-010
    Page Should Contain Textfield    //input[@name='FirstName']    Element not found. Please check the locator    DEBUG
    Input Text    name=FirstName    Devyani
    Sleep    2
    Textfield Value Should Be    //input[@name='FirstName']    Devyani
    Sleep    2
    Clear Element Text    //input[@name='FirstName']
    Sleep    2
    [Teardown]    close browser

ListDemo
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-010
    Page Should Contain List    css:#FromCity    Element not found    DEBUG
    @{cities}    Get List Items    css:#FromCity
    FOR    ${city}    IN    @{cities}
        LOG    ${city}
    END
    Sleep    4
    List Selection Should Be    css:#FromCity    Toronto
    Select From List By Index    css:#FromCity    1
    Sleep    2
    Select From List By Label    css:#FromCity    Chicago
    Sleep    2
    [Teardown]    close browser

TableDemo
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Sleep    2
    Select Frame    id=iframe-010
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table    Table not found    DEBUG
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    ${Text}    Get Text    //tbody/tr[4]/td[1]
    Log To Console    ${Text}
    Should Be Equal As Strings    ${Text}    Theresa May
    FOR    ${row}    IN    @{rows}
    [Teardown]    close browser

Assignment6
    Wait Until Keyword Succeeds    2 min    5 sec    Open Browser    https://ngendigital.com/demo-application    chrome
    Select Frame    id=iframe-010
    Wait Until Keyword Succeeds    2 min    5 sec    LoginFlightApplication
    Wait Until Page Contains    Invalid username/password
    [Teardown]    close browser
