*** Settings ***
Resource    ../base.robot

*** Variables ***
${Select_Protocal} =    xpath=//*[@id="cbid.network.wan.proto"]
${Button_Save} =    xpath=//*[@id="maincontent"]/div/form/div[3]/input[1]

*** Keywords ***
Config DHCP Client
    [Arguments]
    [Documentation]
    [Tags]
    Wait Until Keyword Succeeds    10x    2s    click links    web    Networking  Internet Connection
    Wait Until Keyword Succeeds    10x    2s    select_from_list_by_value    web    ${Select_Protocal}    dhcp
    Wait Until Keyword Succeeds    10x    2s    cpe click    web    ${Button_Save}