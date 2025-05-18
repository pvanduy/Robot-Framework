*** Settings ***
Library           RPA.Browser.Selenium    WITH NAME    RPA
Resource         ../resources/variables.robot

*** Variables ***
${URL}            https://demoqa.com/radio-button

*** Test Cases ***
Verify Radio Button Functionality
    [Documentation]    Test to verify the functionality of a radio button
    RPA.Open Browser       ${URL}    ${BROWSER}    options=add_argument("--headless")
    RPA.Wait Until Element Is Visible    css=.custom-control-label[for='yesRadio']    timeout=10s
    RPA.Click Element    css=.custom-control-label[for='yesRadio']
    RPA.Capture Page Screenshot
    ${is_selected}    RPA.Get Element Attribute    css=#yesRadio    checked
    Should Be Equal As Strings    ${is_selected}    true
    RPA.Close Browser