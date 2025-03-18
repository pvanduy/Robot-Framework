*** Settings ***
Documentation    Testing the login functionlity
Resource         ../resources/variables.robot
Resource        ../resources/common_keywords.robot

*** Test Cases ***
Read Excel File
    [Documentation]    Read search queries from a CSV file and search on Google.
    Read Excel Files