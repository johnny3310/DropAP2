*** Settings ***
Resource      ../../variable/Networking/var_Wireless.robot
Resource      ../kw_Common.robot
Resource      ../base.robot


*** Keywords ***

Set SSID Value
    [Arguments]  ${ssid}
    input text    web    ${Input_SSID}    ${ssid}
    cpe click       web    ${Button_SAVE}
    kw_Common.Wait Until Config Has Applied Completely

Backup Previous SSID Value
    ${element_value} =     Get Element Value     web      ${Input_SSID}
    Set Test Variable       ${Previous_SSID}    ${element_value}
Restore To Previous SSID Value
    Set SSID Value       ${Previous_SSID}


Should SSID Value Be Equal
    [Arguments]  ${ssid}
    Wait Until Element Is Visible    web    ${Input_SSID}
    ${input_text}=     Get Element value    web     ${Input_SSID}
    should be equal   ${ssid}    ${input_text}

