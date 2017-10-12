*** Settings ***
Resource    ./base.robot
Resource    ./keyword/Common.robot
Resource    ./keyword/Device_Management/Reboot_Reset.robot

*** Variables ***

*** Test Cases ***
tc_Reset
    [Documentation]
    [Tags]   @tcid=    @DUT=wrtm-326acn-dropap2     @AUTHOR=Gemtek_Hans_Sun
    [Timeout]
    
    Login Web GUI
    Click Reset Button

*** Keywords ***

*** comment ***
2017-10-11     Gemtek_Hans_Sun
Init the script
