*** Settings ***
Library    RPA.Browser.Selenium    WITH NAME    RPA
Resource    ../resources/variables.robot

** Variables ***
${BROWSER_PAGE}    https://demoqa.com/links

*** Test Cases ***
Handle Links
    [Documentation]    Open browser and click button to open new tab
    
    RPA.Open Browser    ${BROWSER_PAGE}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")

    RPA.Wait Until Element Is Visible    id=simpleLink
    RPA.Click Element    id=simpleLink
    
    RPA.Switch Window    locator=New
    RPA.Wait Until Location Is    https://demoqa.com/
    RPA.Capture Page Screenshot
    
    RPA.Close Window