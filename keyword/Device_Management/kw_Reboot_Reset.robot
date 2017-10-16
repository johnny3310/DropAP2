*** Settings ***
Resource    ../base.robot

*** Variables ***
${Button_Reboot} =    xpath=//*[@id="reboot-button"]
${Button_Reset} =    xpath=//*[@id="maincontent"]/div/input[2]

*** Keywords ***
Click Reboot Button
    [Arguments]
    [Documentation]    Click Reboot Button
    [Tags]    @AUTHOR=Gemtek_Hans_Sun
    Wait Until Keyword Succeeds    10x    2s    click links    web    Device Management  Reboot/Reset
    Wait Until Keyword Succeeds    10x    2s    cpe click    web    ${Button_Reboot}
    Wait Until Element Is Visible    web    ${Link_Configure_DropAP}    timeout=120

Click Reset Button
    [Arguments]
    [Documentation]    Click Reset Button
    [Tags]    @AUTHOR=Gemtek_Hans_Sun
    Wait Until Keyword Succeeds    10x    2s    click links    web    Device Management  Reboot/Reset
    Wait Until Keyword Succeeds    10x    2s    cpe click    web    ${Button_Reset}
    ${r}  run keyword and return status    Wait Until Element Is Visible    web    ${Link_Setup_DropAP}    timeout=120
    run keyword if  '${r}'=='False'    run keywords    Reload Page    web
    ...    AND    sleep    1
    ...    AND    Element Should Be Visible    web    ${Link_Setup_DropAP}