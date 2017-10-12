*** Settings ***
Resource      ./var_Wireless.robot
Resource      libs/lib_index.robot
Resource      ./base.robot
Resource      var_Main_Menu.robot

*** Keywords ***

Set SSID Value
    [Arguments]  ${ssid}
    input text    web    ${Input_SSID}    ${ssid}
    cpe click       web    ${Button_SAVE}

Should SSID Value Be Equal
    [Arguments]  ${ssid}
    Wait Until Element Is Visible    web    ${Input_SSID}
    ${input_text}=     Get Element value    web     ${Input_SSID}
    should be equal   ${ssid}    ${input_text}

