*** Settings ***
Resource    ./base.robot
Resource    var_Internet_Connection.robot

*** Keywords ***
Config DHCP Client
    [Arguments]
    [Documentation]
    [Tags]
    Wait Until Keyword Succeeds    10x    2s    click links    web    Networking  Internet Connection
    Wait Until Keyword Succeeds    10x    2s    select_from_list_by_value    web    ${Select_Protocal}    dhcp
    Wait Until Keyword Succeeds    10x    2s    cpe click    web    ${Button_Save}