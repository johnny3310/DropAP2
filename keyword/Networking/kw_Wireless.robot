*** Settings ***
Resource      ../../variable/Networking/var_Wireless.robot
Resource      ../kw_Common.robot
Resource      ../base.robot


*** Keywords ***

Set SSID Value
    [Arguments]  ${ssid}
    input text    web    ${Input_SSID}    ${ssid}
    Save Wireless Config

Set Hidden SSID Checkbox to Checked
     kw_Common.Check Checkbox     ${Checkbox_Hidden_SSID}
     Save Wireless Config

Verify Hidden SSID Checkbox is Checked
    Checkbox Should Be Selected     web     ${Checkbox_Hidden_SSID}

Backup Previous Checkbox Hidden SSID State
    ${checkbox_state} =     run keyword and return status   Checkbox Should Be Selected     web     ${Checkbox_Hidden_SSID}
    Set Test Variable       ${Previous_Checkbox_Hidden_SSID_State}    ${checkbox_state}

Restore To Previous Checkbox Hidden SSID State
    [Documentation]  Restore the checkbox state
    kw_Common.Set Checkbox State     ${Checkbox_Hidden_SSID}      ${Previous_Checkbox_Hidden_SSID_State}
    Save Wireless Config

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




Backup Previous Security And Password State
    [Documentation]  Backup Security List Value, if Security List Value is not Open, Backup Password Value
    ${security_value}=   Wait Until Keyword Succeeds    5x    3s    get_selected_list_labels    web    ${Select_Security}
    Set Test Variable   ${Previous_Select_Security}     ${security_value}
    ${Previous_Input_Password}=     Run Keyword Unless  ${Previous_Select_Security}=='Open'
    ...  Get Element Value     web      ${Input_Password}

Set Security And Password
    [Documentation]  Write Security and Password Value, write password value when Security value is not "Open"
    [Arguments]     ${security}     ${password}
    select_from_list_by_value    web    ${Select_Security}    ${security}
    Run Keyword Unless  ${security}=='Open'
    ...   input text    web    ${Input_Password}    ${password}
    Save Wireless Config


Verify Security And Password Were Set
    [Arguments]     ${security}    ${password}
    Verify Security was Set     ${security}
    Run Keyword Unless  ${security}=='Open'
    ...   Verify Password was Set     ${password}

Verify Security was Set
     [Arguments]     ${security}
     ${current_securiry_value}=    Wait Until Keyword Succeeds    5x    3s    get_selected_list_labels    web    ${Select_Security}
     should be equal   ${security}    ${current_securiry_value}

Verify Password was Set
    [Arguments]   ${password}
    ${current_password_value}=      Get Element Value     web      ${Input_Password}
    should be equal   ${password}    ${current_password_value}

Restore To Previous Security State
    Set Security And Password   ${Previous_Select_Security}     ${Previous_Input_Password}


Save Wireless Config
    cpe click       web    ${Button_SAVE}
    kw_Common.Wait Until Config Has Applied Completely
