*** Settings ***
Library           RPA.Browser.Selenium    WITH NAME    RPA
Resource         ../resources/variables.robot

*** Variables ***
${URL}            https://demoqa.com/checkbox

*** Test Cases ***
Verify Check Box Functionality
    [Documentation]    Test to verify the functionality of a checkbox
    RPA.Open Browser       ${URL}    ${BROWSER}    options=add_argument("--headless")
    RPA.Wait Until Element Is Visible    css=#tree-node .rct-checkbox > svg    timeout=10s
    RPA.Click Element    css=#tree-node .rct-checkbox > svg
    ${is_selected}    RPA.Get Element Attribute    css=#tree-node .rct-checkbox > svg    class
    Should Be Equal    ${is_selected}    rct-icon rct-icon-check
    RPA.Close Browser