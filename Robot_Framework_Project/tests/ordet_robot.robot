*** Settings ***
Library    RPA.Browser.Selenium    WITH NAME    RPA
Library    RPA.Tables    WITH NAME    TABLES
Resource    ../resources/variables.robot


Suite Setup    Open The Website
Suite Teardown    Close Browser

*** Variables ***
${BROWSER_PAGE}    https://robotsparebinindustries.com/
${COUNT}    0
${CSV_FILE}    /orders.csv


*** Test Cases ***
Order Multiple Robots
    [Documentation]    Open browser and handle order form
    [Tags]    order    robots
    ${table}    Open CSV File
    FOR    ${row}    IN    @{table}
        Order Robot    ${row}[head]    ${row}[body]    ${row}[legs]    ${row}[address]
    END

*** Keywords ***
Open The Website
    [Documentation]    Open the website and navigate to the order form
    RPA.Open Browser    ${BROWSER_PAGE}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")
    RPA.Click Element    xpath=//*[text()='Order your robot!']

Order Robot
    [Arguments]    ${head}    ${body}    ${legs}    ${address}
    [Documentation]    Order a robot and handle the order form
    RPA.Wait Until Element Is Visible    xpath=//button[text()='OK']
    RPA.Click Button    xpath=//button[text()='OK']
    RPA.Wait Until Element Is Visible    xpath=//*[text()='Build and order your robot!']
    RPA.Select From List By Index    id=head    ${head}
    RPA.Click Button When Visible    id=id-body-${body}
    RPA.Input Text    xpath=//*[@placeholder='Enter the part number for the legs']    ${legs}
    RPA.Input Text    xpath=//*[@placeholder='Shipping address']    ${address}
    RPA.Click Button    xpath=//button[text()='Preview']
    RPA.Wait Until Element Is Visible    xpath=//*[text()='Admire your robot!']
    RPA.Wait Until Element Is Visible    xpath=//img[@alt='Head']
    RPA.Wait Until Element Is Visible    xpath=//img[@alt='Body']
    RPA.Wait Until Element Is Visible    xpath=//img[@alt='Legs']
    RPA.Capture Element Screenshot    id=robot-preview
    RPA.Click Button    xpath=//button[text()='Order']
    ${is_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//*[@class='alert alert-danger']    timeout=5s
    WHILE    ${is_visible}
        ${COUNT}=    Evaluate    ${COUNT} + 1
        Log    retry order robots: ${COUNT}
        RPA.Click Button    xpath=//button[text()='Order']
        ${is_visible}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath=//*[@class='alert alert-danger']    timeout=5s
    END
    RPA.Wait Until Element Is Visible    xpath=//h3[text()='Receipt']
    RPA.Click Button    xpath=//button[text()='Order another robot']

Open CSV File
    [Documentation]    Open the CSV file and write the order details
    ${table}    TABLES.Read table from CSV    path=${EXECDIR}${/}${CSV_FILE}    
    RETURN    ${table}
    