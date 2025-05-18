*** Settings ***
Resource    ../resources/common_keywords.robot
Library    RPA.Browser.Selenium    WITH NAME    RPA
*** Variables ***
${BROWSER_PAGE}    https://demoqa.com/text-box
${TEXT_}    hello world


*** Test Cases ***
Enter Text In Text Box
    [Documentation]    Open browser and input username in the login form
    
    RPA.Open Browser    ${BROWSER_PAGE}    ${BROWSER}    options=add_argument("--headless")
    RPA.Wait Until Element Is Visible    id=userName
    RPA.Input Text    id=userName    ${TEXT_}
        Log    input text 
    RPA.Capture Element Screenshot    id=userName
    RPA.Is Textfield Value    id=userName    ${TEXT_}
    RPA.Close Browser
