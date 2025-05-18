*** Settings ***
Library    RPA.Browser.Selenium    WITH NAME    RPA
Resource    ../resources/variables.robot

*** Variables **
${BROWSER_PAGE}    https://demoqa.com/modal-dialogs

*** Test Cases **
Handle Modal Dialog
    [Documentation]    Open browser and click button to open new tab
    
    RPA.Open Browser    ${BROWSER_PAGE}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")
    RPA.Wait Until Element Is Visible    id=showSmallModal
    RPA.Click Element    id=showSmallModal
    RPA.Wait Until Element Is Visible    id=example-modal-sizes-title-sm
    RPA.Element Text Should Be    id=example-modal-sizes-title-sm    Small Modal
    RPA.Capture Page Screenshot

    RPA.Click Element    xpath=//button[text()='Close']
    RPA.Wait Until Element Is Not Visible    id=example-modal-sizes-title-sm

    RPA.Close Browser