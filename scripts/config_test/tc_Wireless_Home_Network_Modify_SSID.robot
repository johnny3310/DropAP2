*** Settings ***
Resource   keyword/Common.robot
Resource   keyword/kw_Main_Menu.robot

Test Setup   Common.Start Test
Test Teardown  Common.End Test
Force Tags  @AUTHOR=Gemtek_Johnny_Peng
*** Variables ***
${Config_Name} =    johnny created dhcp config

*** Test Cases ***
tc_Wireless_Home_Network_Modify_SSID
    [Documentation]   tc_Wireless_Home_Network_Modify_SSID
    ...    1. Go to wireless home network page
    ...    2. Modify ssid
    ...    3. verify ssid has been changed
    ...    4. Restore ssid to previous state

    [Tags]   config_test     modify_ssid
    [Timeout]
    Go to wireless home network page
    Modify ssid
    Verify ssid has been changed
    Restore ssid to previous state
*** Keywords ***
Go to wireless home network page
    Front_Page.Head to Configure DropAP
    Main_Menu.Open Newworking Wireless Page


*** comment ***