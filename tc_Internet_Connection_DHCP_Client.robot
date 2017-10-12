*** Settings ***
Resource    ./base.robot
Resource    ./keyword/libs/lib_index.robot
Resource    ./keyword/Networking/Internet_Connection.robot

*** Variables ***
${message}    Your firmware is up to date.

*** Test Cases ***
tc_Firmware_check
    [Documentation]
    [Tags]   @tcid=    @DUT=wrtm-326acn-dropap2     @AUTHOR=Gemtek_Hans_Sun
    [Timeout]

    Login Web GUI
    Config DHCP Client

*** Keywords ***
Login Web GUI
    [Arguments]
    [Documentation]    Login Web GUI
    [Tags]

    login ont    web    ${g_dut_gui_url}

*** comment ***
2017-10-11     Gemtek_Hans_Sun
Init the script
