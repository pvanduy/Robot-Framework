*** Settings ***
Documentation    Testing the login functionlity
Resource         ../resources/variables.robot
Resource        ../resources/common_keywords.robot


Test Setup    Common Open Login Page
Test Teardown    Common Close Browser
Library    OperatingSystem

*** Test Cases ***
Positive Login
    [Tags]    smoke    login
    Common Input Username    ${VALID_USER}
    Common Input Password    ${VALID_PASS}
    Common Click Login Button
    Common Verify Login Success
    Common Click Logout Button

Negative Login
    [Tags]    regression    login
    Common Input Username    ${VALID_USER}
    Common Input Password    ${INVALID_PASS}
    Common Click Login Button
    Common Verify Login Failed