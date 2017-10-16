*** Settings ***
Resource    ./base.robot

*** Variables ***
${Loading_Block} =      css=div[class="Loading"]
${Sign_Config_Is_Applying}=    css=imag[alt="Loading"]

*** Keywords ***

Login Web GUI
    login ont    web    ${g_dut_gui_url}

End Test
    Close Browser   web

Wait Until Config Has Applied Completely
    [Documentation]  Wait until config is applying animated sign has disapear
        wait until element is not visible       web       ${Sign_Config_Is_Applying}    30s



Check Checkbox
    [Arguments]  ${checkbox_locator}
    Set Checkbox State  ${checkbox_locator}     True

Uncheck Checkbox
    [Arguments]  ${checkbox_locator}
    Set Checkbox State  ${checkbox_locator}     False

Set Checkbox State
    [Arguments]     ${checkbox_locator}     ${set_checkbox_state}
    ${checkbox_state} =     Assert Checkbox is checked      ${checkbox_locator}
    #if checkbox state is not equal, then click check box
    run keyword Unless      ${checkbox_state}==${set_checkbox_state}      cpe click     web   ${checkbox_locator}

Assert Element is visible
    [Arguments]     ${locator}
    [Return]    run keyword and return status   element should be visible   web    ${locator}
Assert Checkbox is checked
     [Arguments]  ${checkbox_locator}
     ${checkbox_state} =     run keyword and return status   Checkbox Should Be Selected    web     ${checkbox_locator}
     [Return]  ${checkbox_state}
#Click Visible Element
#    [Arguments]     ${browser}     ${locator}
#    Wait Until Element Is Visible   ${locator}      10s
#    Click Element   ${locator}
#
#Wait Until Block UI Disapear
#    wait until element is not visible   ${Loading_Block}    30s


