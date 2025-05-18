*** Settings ***
Library    RPA.Browser.Selenium    WITH NAME    RPA
Library           RequestsLibrary
Resource    ../resources/variables.robot

*** Variables ***
${BROWSER_PAGE}    https://demoqa.com/broken

*** Test Cases ***
Handle Broken Links
    [Documentation]    Open browser and click button to open new tab
    
    RPA.Open Browser    ${BROWSER_PAGE}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")
    RPA.Wait Until Element Is Visible    xpath=//a[text()='Click Here for Broken Link']
    RPA.Scroll Element Into View    xpath=//a[text()='Click Here for Broken Link']
    RPA.Click Element    xpath=//a[text()='Click Here for Broken Link']
    RPA.Wait Until Location Is    https://the-internet.herokuapp.com/status_codes/500
    
    Create Session    mysession    https://the-internet.herokuapp.com
    ${response}    Get Request    mysession    /status_codes/500
    Log    ${response.status_code}

    Should Be Equal As Integers    ${response.status_code}    500
    RPA.Capture Page Screenshot
    RPA.Close Browser