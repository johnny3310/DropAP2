*** Settings ***
Resource    ./base.robot

*** Variables ***
${Loading_Block} =      css=div[class="Loading"]
${Sign_Config_Is_Applying}=    css=imag[alt="Loading"]

*** Keywords ***

Login Web GUI
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    login ont    web    ${g_dut_gui_url}

End Test
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    Close Browser   web

Wait Until Config Has Applied Completely
    [Documentation]  Wait until config is applying animated sign has disapear
    wait until element is not visible       web       ${Sign_Config_Is_Applying}    30s


Check Checkbox
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    [Arguments]  ${checkbox_locator}
    Set Checkbox State  ${checkbox_locator}     True

Uncheck Checkbox
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    [Arguments]  ${checkbox_locator}
    Set Checkbox State  ${checkbox_locator}     False

Set Checkbox State
    [Documentation]     If current state is not equal to assigned state, click checkbox once to make it consist to assigned state
    [Tags]   @AUTHOR=Johnny_Peng
    [Arguments]     ${checkbox_locator}     ${set_checkbox_state}
    ${checkbox_state} =     Assert Checkbox is checked      ${checkbox_locator}
    #if checkbox state is not equal, then click check box
    run keyword Unless      ${checkbox_state}==${set_checkbox_state}      cpe click     web   ${checkbox_locator}

Assert Element is visible
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    [Arguments]     ${locator}
    [Return]    run keyword and return status   element should be visible   web    ${locator}

Assert Checkbox is checked
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    [Arguments]  ${checkbox_locator}
    ${checkbox_state} =     run keyword and return status   Checkbox Should Be Selected    web     ${checkbox_locator}
    [Return]  ${checkbox_state}



