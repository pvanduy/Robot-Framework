*** Settings ***
Library    RPA.Browser.Selenium    WITH NAME    RPA
Resource    ../resources/variables.robot

*** Variables **
${BROWSER_PAGE}    https://demoqa.com/auto-complete

*** Test Cases **
Handle Auto Complete
    [Documentation]    Open browser and click button to open new tab    setTimeout(() => {debugger}, 3000)
    
    RPA.Open Browser    ${BROWSER_PAGE}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")
    RPA.Wait Until Element Is Visible    id=autoCompleteSingleInput
    RPA.Input Text    xpath=//input[@id='autoCompleteMultipleInput']    a
    RPA.Wait Until Element Is Visible    xpath=//*[text()='Magenta']
    
    RPA.Click Element    xpath=//*[text()='Magenta']
    RPA.Capture Page Screenshot
    RPA.Close Browser