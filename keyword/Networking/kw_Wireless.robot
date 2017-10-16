*** Settings ***
Resource      ../base.robot


*** Variables ***
${Input_SSID} =     css=input[id="cbid.wireless.ra0.ssid"]
${Checkbox_Hidden_SSID} =      id=cbid.wireless.ra0.hidden
${Select_Security}=    css=select[id="cbid.wireless.ra0.encryption"]
${Input_Password}=     css=input[id="cbid.wireless.ra0._wepkey"]
${Button_SAVE} =    xpath=/html/body/div/div[3]/div[2]/div/form/div[3]/input[1]
${Select_Guest_Turn_On_Off}=    css=select[id="cbid.wireless.ra1.disabled"]
${Input_Guest_SSID}=    css=input[id="cbid.wireless.ra1.ssid"]
${Previous_SSID} =
${Previous_Checkbox_Hidden_SSID_State}=
${Previous_Select_Security}=
${Previous_Input_Password}=
#${Previous_Guest_Network_Radio_On_Off}=
${Previous_Guest_Network_SSID}=


*** Keywords ***

Set SSID Value
    [Arguments]  ${ssid}
    input text    web    ${Input_SSID}    ${ssid}
    Save Wireless Config

Set Hidden SSID Checkbox to Checked
     Check Checkbox     ${Checkbox_Hidden_SSID}
     Save Wireless Config

Verify Hidden SSID Checkbox is Checked
    Checkbox Should Be Selected     web     ${Checkbox_Hidden_SSID}

Backup Previous Checkbox Hidden SSID State
    ${checkbox_state} =     run keyword and return status   Checkbox Should Be Selected     web     ${Checkbox_Hidden_SSID}
    Set Test Variable       ${Previous_Checkbox_Hidden_SSID_State}    ${checkbox_state}

Restore To Previous Checkbox Hidden SSID State
    [Documentation]  Restore the checkbox state
    Set Checkbox State     ${Checkbox_Hidden_SSID}      ${Previous_Checkbox_Hidden_SSID_State}
    Save Wireless Config
Reset To Default Checkbox Hidden SSID State
    Uncheck Checkbox     ${Checkbox_Hidden_SSID}
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
    Backup Previous Security State
    Backup Previous Password State

Backup Previous Security State
    ${security_value}=   Wait Until Keyword Succeeds    5x    3s    get selected list label    web    ${Select_Security}
    Set Test Variable   ${Previous_Select_Security}     ${security_value}

Backup Previous Password State
    ${input_password_is_visible}=   Assert Element is visible     ${Input_Password}
    Run Keyword Unless      ${input_password_is_visible}==True
    ...                      Return From Keyword

    ${password}=     Get Element Value     web      ${Input_Password}
    Set Test Variable   ${Previous_Input_Password}     ${password}

Set Security And Password
    [Documentation]  Write Security and Password Value, write password value when Security value is not "Open"
    [Arguments]     ${security}     ${password}
    Set Security Value    ${security}
    Set Password    ${password}
    Save Wireless Config

Set Security Value
    [Arguments]       ${security}
    Select From List By Label    web    ${Select_Security}    ${security}

Set Password
    [Arguments]     ${password}
    ${input_password_is_visible}=    Assert Element is visible   ${Input_Password}
    Run Keyword Unless      ${input_password_is_visible}==True
        ...                      Return From Keyword
    input text    web    ${Input_Password}    ${password}

Verify Security And Password Were Set
    [Arguments]     ${security}    ${password}
    Verify Security was Set     ${security}
    Verify Password was Set     ${password}

Verify Security was Set
     [Arguments]     ${security}
     ${current_securiry_value}=    Wait Until Keyword Succeeds    5x    3s    get selected list label    web    ${Select_Security}
     should be equal   ${security}    ${current_securiry_value}

Verify Password was Set
    [Arguments]   ${password}
    ${input_password_is_visible}=    Assert Element is visible   ${Input_Password}
    Run Keyword Unless      ${input_password_is_visible}==True
    ...                      Return From Keyword
    ${current_password_value}=      Get Element Value     web      ${Input_Password}
    should be equal   ${password}    ${current_password_value}

Restore To Previous Security State
    Set Security And Password   ${Previous_Select_Security}     ${Previous_Input_Password}


#Guest Network

Set Guest Network Radio State
    [Arguments]     ${radio_on_off}
    Select From List By Label    web    ${Select_Guest_Turn_On_Off}    ${radio_on_off}
    Save Wireless Config

Guest Network Radio Should Be
    [Arguments]     ${radio_on_off}
    ${current_radio_is_on_off}=    Wait Until Keyword Succeeds    5x    3s    get selected list label    web    ${Select_Guest_Turn_On_Off}
    should be equal   ${radio_on_off}     ${current_radio_is_on_off}

Backup Current Guest Network SSID
     ${element_value} =     Get Element Value     web      ${Input_Guest_SSID}
     Set Test Variable       ${Previous_Guest_Network_SSID}    ${element_value}

Guest Network SSID Should Be
    [Arguments]     ${guest_network_ssid}
    ${current_guest_network_ssid_value}=      Get Element Value     web      ${Input_Guest_SSID}
    should be equal   ${guest_network_ssid}     ${current_guest_network_ssid_value}

Restore Guest Network SSID
    Set Guest Network SSID    ${previous_guest_network_ssid}

Set Guest Network SSID
    [Arguments]     ${guest_network_ssid}
    input text    web    ${Input_Guest_SSID}    ${guest_network_ssid}
    Save Wireless Config
#

Save Wireless Config
    cpe click       web    ${Button_SAVE}
    Wait Until Config Has Applied Completely


