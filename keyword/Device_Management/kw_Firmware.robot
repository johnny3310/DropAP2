*** Settings ***
Resource    ../base.robot

*** Variables ***
${Button_Check} =    xpath=//*[@id="btn-check"]

*** Keywords ***
Click Firmware Check Button
    [Arguments]
    [Documentation]    Click Firmware Check Button
    [Tags]    @AUTHOR=Gemtek_Hans_Sun
    Wait Until Keyword Succeeds    10x    2s    click links    web    Device Management  Firmware
    Wait Until Keyword Succeeds    10x    2s    cpe click    web    ${Button_Check}

