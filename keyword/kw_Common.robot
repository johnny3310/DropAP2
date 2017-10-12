*** Settings ***
Resource    libs/lib_index.robot
Resource    var_Common.robot
Resource    ./base.robot



*** Keywords ***

Login Web GUI
    login ont    web    ${g_dut_gui_url}

End Test
    Close Browser   web

#Click Visible Element
#    [Arguments]     ${browser}     ${locator}
#    Wait Until Element Is Visible   ${locator}      10s
#    Click Element   ${locator}
#
#Wait Until Block UI Disapear
#    wait until element is not visible   ${Loading_Block}    30s


