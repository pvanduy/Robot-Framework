*** Settings ***

Library    RPA.Browser.Selenium    WITH NAME    RPA
Library    RPA.FTP    WITH NAME    FTP
Resource    ../resources/variables.robot

*** Variables ***
${BROWSER_PAGE}    https://demoqa.com/upload-download

*** Test Cases ***
Handle Upload and Download
    [Documentation]    Open browser and upload a file
    [Tags]    upload    download

    Open Chrome With Auto Download    ${BROWSER_PAGE}
    RPA.Wait Until Element Is Visible    id=uploadFile
    RPA.Choose File    id=uploadFile    ${EXECDIR}${/}example.xlsx
    RPA.Capture Page Screenshot

    RPA.Wait Until Element Is Visible    id=downloadButton
    RPA.Click Element    id=downloadButton
    RPA.Capture Page Screenshot
    
    RPA.Close Browser

*** Keywords ***
Open Chrome With Auto Download
    [Arguments]    ${URL}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    &{prefs}=    Create Dictionary
    ...    download.default_directory=${EXECDIR}${/}
    ...    download.prompt_for_download=False
    ...    plugins.always_open_pdf_externally=True
    
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    RPA.Open Browser    ${URL}    ${BROWSER}    options=${options}