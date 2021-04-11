*** Settings ***
Test Teardown     close browser
Resource          FlightApplicationKeywords.txt    # Common keywords for flight application

*** Variables ***
${loginUsername}    ${EMPTY}
${loginPassword}    ${EMPTY}

*** Test Cases ***
TC01_LoginScreen_ObjectsOnPage
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    [Teardown]

TC02_VerifyDefaultValuesLoginPage
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    DefaultValuesVerificationLoginPage
    [Teardown]

TC03_ValidateNoEmailIDSignIn
    Wait Until Keyword Succeeds    2    1    NavigateToURL
    Wait Until Keyword Succeeds    2    1    SwitchToiFrame    id=iframe-010
    Wait Until Keyword Succeeds    2    1    ClearTextField    xpath://input[@name='email']
    Wait Until Keyword Succeeds    2    1    EnterPassword    abc123
    Wait Until Keyword Succeeds    2    1    SignIn
    Wait Until Keyword Succeeds    2    1    VerifyMissingUsernameMsg

TC04_ValidateNoPasswordSignIn
    Wait Until Keyword Succeeds    2    1    NavigateToURL
    Wait Until Keyword Succeeds    2    1    SwitchToiFrame    id=iframe-010
    Wait Until Keyword Succeeds    2    1    ClearTextField    xpath://input[@name='passwd']
    Wait Until Keyword Succeeds    2    1    EnterLoginID    support@ngendigital.com
    Wait Until Keyword Succeeds    2    1    SignIn
    Wait Until Keyword Succeeds    2    1    VerifyMissingPasswordMsg

TC05_NoEmailIDAndPasswordSignIn
    Wait Until Keyword Succeeds    2    1    NavigateToURL
    Wait Until Keyword Succeeds    2    1    SwitchToiFrame    id=iframe-010
    Wait Until Keyword Succeeds    2    1    ClearTextField    xpath://input[@name='email']
    Wait Until Keyword Succeeds    2    1    ClearTextField    xpath://input[@name='passwd']
    Wait Until Keyword Succeeds    2    1    SignIn
    Wait Until Keyword Succeeds    2    1    VerifyMissingEmailAndPasswordMsg

TC06_InvalidEmailFormat
    Wait Until Keyword Succeeds    2    1    NavigateToURL
    Wait Until Keyword Succeeds    2    1    SwitchToiFrame    id=iframe-010
    Wait Until Keyword Succeeds    2    1    EnterPassword    abc123
    Wait Until Keyword Succeeds    2    1    EnterLoginID    support*ngendigital.com
    Wait Until Keyword Succeeds    2    1    SignIn
    Wait Until Keyword Succeeds    2    1    VerifyInvalidLoginMsg

TC07_LoginWithValidUsernamePassword
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification

TC08_ManageBookingVerifyFromCitites
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification
    SwitchToTab    Manage Booking
    ManageBookingTabElementsVerification
    VerifyFromCities
    Logout

TC09_ManageBookingVerifyToCitites
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification
    SwitchToTab    Manage Booking
    ManageBookingTabElementsVerification
    VerifyToCities
    Logout

TC10_ManageBookingVerifyClasses
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification
    SwitchToTab    Manage Booking
    ManageBookingTabElementsVerification
    VerifyFlightClass
    Logout

TC11_ManageBookingFlightOnly
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification
    SwitchToTab    Manage Booking
    ManageBookingTabElementsVerification
    SelectFlightOnly
    Logout

TC12_FlightBookingE2E_1
    [Documentation]    Book a Flight - One way Trip between To and From Destinations_From Toronto to Paris_Economy
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification
    SwitchToTab    Manage Booking
    ManageBookingTabElementsVerification
    SelectFromCity    Toronto
    SelectToCity    Paris
    SelectStartDate    21-06-2019
    SelectReturnDate    28-06-2019
    SelectClass    Economy
    SelectRoundTrip
    SelectFlightAndHotel
    Capture Page Screenshot
    Click Element    xpath://button[contains(text(),'Get Fare')]
    Capture Page Screenshot
    ConfirmBookingAndVerify
    Capture Page Screenshot

TC13_FlightHotelValidation
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification
    SwitchToTab    Manage Booking
    ManageBookingTabElementsVerification
    GetFare
    Wait Until Keyword Succeeds    2    1    Page Should Contain    Please choose one of Flight or Flight + Hotel!

TC14_SearchFlightByFlightNumber
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification
    SwitchToTab    Search Flights
    SearchFlightsTabElementsVerification
    SearchFlightByFlightNumber    DA935
    VerifyFlightTableColumns    Toronto(YYZ) to London(LHR)
    VerifyOnTimeDeparture    DA935

TC15_VerifyFlightNumber
    NavigateToURL
    SwitchToiFrame    id=iframe-010
    LoginPageObjectsVerification
    ${loginUsername}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    email
    ${loginPassword}    GetDataFromExcel    excelDemo.xls    excelDemo    TC07    password
    EnterLoginID    ${loginUsername}
    EnterPassword    ${loginPassword}
    SignIn
    SwitchToiFrame    id=iframe-undefined10
    PostLoginElementsVerification
    SwitchToTab    Search Flights
    SearchFlightsTabElementsVerification
    VerifyValidFlightNumber    DA936
