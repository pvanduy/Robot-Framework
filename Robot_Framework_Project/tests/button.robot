*** Settings ***
Library    RPA.Browser.Selenium    WITH NAME    RPA
Resource    ../resources/common_keywords.robot

*** Variables ***
${BROWSER_PAGE}    https://demoqa.com/buttons


*** Test Cases ***
Click Button
    [Documentation]    Open browser and click button in the login form
    
    RPA.Open Browser    ${BROWSER_PAGE}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")
    RPA.Wait Until Element Is Visible    id=doubleClickBtn
    RPA.Double Click Element    id=doubleClickBtn
        Log    double click button 
    RPA.Capture Page Screenshot

    RPA.Click Element    id=rightClickBtn
        Log    right click button
    RPA.Capture Page Screenshot

    RPA.Click Element    xpath=//button[text()='Click Me']
        Log    click button
    RPA.Capture Page Screenshot
    RPA.Close Browser