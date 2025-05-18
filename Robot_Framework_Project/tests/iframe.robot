*** Settings ***
Library    RPA.Browser.Selenium    WITH NAME    RPA
Resource    ../resources/variables.robot

*** Variables ***
${BROWSER_PAGE1}    https://demoqa.com/frames
${BROWSER_PAGE2}    https://demoqa.com/nestedframes

*** Test Cases ***
Handle Iframe
    [Documentation]    Open browser and click button to open new tab
    
    RPA.Open Browser    ${BROWSER_PAGE1}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")
    RPA.Wait Until Element Is Visible    id=frame1
    RPA.Select Frame    id=frame1
    RPA.Wait Until Element Is Visible    id=sampleHeading
    RPA.Element Text Should Be    id=sampleHeading    This is a sample page
    RPA.Capture Element Screenshot    id=sampleHeading
    RPA.Unselect Frame

    RPA.Scroll Element Into View    xpath=//*[@id="app"]/div/div/div/div[2]/div[3]
    Execute JavaScript    document.getElementById("frame2").style.height="200px"
    Execute Javascript    document.getElementById("frame2").style.width="200px"
    RPA.Select Frame    id=frame2
    RPA.Wait Until Element Is Visible    id=sampleHeading
    RPA.Element Text Should Be    id=sampleHeading    This is a sample page
    
    RPA.Capture Element Screenshot    id=sampleHeading
    RPA.Unselect Frame
    
    RPA.Close Browser


Handle Nested Iframe
    [Documentation]    Open browser and click button to open new tab
    
    RPA.Open Browser    ${BROWSER_PAGE2}    ${BROWSER}    options=add_argument("--headless --window-size=1920,1080")
    RPA.Wait Until Element Is Visible    id=frame1
    RPA.Select Frame    id=frame1
    RPA.Wait Until Element Is Visible    xpath=//iframe[@srcdoc="<p>Child Iframe</p>"]
    RPA.Select Frame    xpath=//iframe[@srcdoc="<p>Child Iframe</p>"]
    RPA.Element Text Should Be    xpath=//p[text()='Child Iframe']    Child Iframe
    RPA.Capture Element Screenshot    xpath=//p[text()='Child Iframe']
    RPA.Unselect Frame
    RPA.Close Browser