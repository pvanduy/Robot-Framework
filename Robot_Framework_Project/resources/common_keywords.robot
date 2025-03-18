*** Settings ***
Library    SeleniumLibrary    WITH NAME    SL
Library    RPA.Tables
Library    ExcelLibrary
Resource   ../resources/variables.robot

*** Keywords ***
Common Open Login Page
    SL.Open Browser    ${LOGIN_URL}    ${BROWSER}

Common Close Browser
    SL.Close All Browsers

Common Input Username
    [Arguments]    ${user_name}
    SL.Input Text    id=username    ${user_name}

Common Input Password
    [Arguments]    ${password}
    SL.Input Text    id=password    ${password}

Common Click Login Button
    SL.Click Element    //*[text()="${LOGIN_TEXT}"]

Common Click Logout Button
    SL.Click Element    //*[text()='${LOGOUT_TEXT}']
    
Common Verify Login Success
    SL.Wait Until Element Is Visible    //*[text()='${VALID_USER}']    2s
    SL.Element Should Be Visible    //*[text()='${VALID_USER}']

Common Verify Login Failed
    SL.Wait Until Element Is Visible    //*[text()='${ERROR_MESS_LOGIN}']    2s
    SL.Element Should Be Visible    //*[text()='${ERROR_MESS_LOGIN}']

Read Excel Files
    Open Excel Document    example.xlsx    1
    ${value}    Read Excel Cell    1    1
    Log    Value in cell A1: ${value}
    Close Current Excel Document