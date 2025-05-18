*** Settings ***
Library    RPA.Browser.Selenium    WITH NAME    RPA
Resource    ../resources/variables.robot

*** Variables ***
${BROWSER_PAGE}    https://demoqa.com/alerts

*** Test Cases ***
Handle Alerts
    [Documentation]    Open browser and click button to open new tab
    
    RPA.Open Browser    ${BROWSER_PAGE}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")
    RPA.Wait Until Element Is Visible    id=alertButton
    RPA.Click Button    id=alertButton
    # RPA.Capture Page Screenshot
    RPA.Handle Alert    ACCEPT
    
    RPA.Wait Until Element Is Visible    id=timerAlertButton
    RPA.Click Button    id=timerAlertButton
    Sleep    7s
    RPA.Handle Alert    ACCEPT
    RPA.Capture Page Screenshot

    RPA.Wait Until Element Is Visible    id=promtButton
    RPA.Click Button    id=promtButton
    RPA.Input Text Into Alert    helloworld
    RPA.Capture Page Screenshot
    
    RPA.Close Browser