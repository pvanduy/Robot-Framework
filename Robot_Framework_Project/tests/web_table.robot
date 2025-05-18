*** Settings ***
Library           RPA.Browser.Selenium    WITH NAME    RPA
Resource         ../resources/variables.robot    

*** Variables ***
${URL}            https://demoqa.com/webtables

*** Test Cases ***
Get All Data From Web Table
    [Documentation]    Retrieve all data from the web table on the page.
    RPA.Open Browser    ${URL}    ${BROWSER}    options=add_argument("--headless")
    @{rows}=    RPA.Get WebElements    xpath=.//div[@class='rt-tr-group']
    FOR    ${row}    IN    @{rows}
        ${row_text}=    RPA.Get Text    locator=${row}
        Log    ${row_text}
        RPA.Capture Element Screenshot    ${row}
    END 

    RPA.Close Browser