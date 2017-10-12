*** Settings ***
Resource    ./base.robot
Resource    ./keyword/Common.robot
Resource    ./keyword/Device_Management/Firmware.robot

*** Variables ***
${message}    Your firmware is up to date.

*** Test Cases ***
tc_Firmware_check
    [Documentation]    Go to firmware page and click check button if message is correct.
    [Tags]   @tcid=    @DUT=wrtm-326acn-dropap2     @AUTHOR=Gemtek_Hans_Sun
    [Timeout]

    Login Web GUI
    Click Firmware Check Button
    page should contain text    web    ${message}

*** Keywords ***

*** comment ***
2017-10-11     Gemtek_Hans_Sun
Init the script
