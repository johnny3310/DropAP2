*** Settings ***
Resource   ../../keyword/kw_Common.robot
Resource   ../../keyword/kw_Main_Menu.robot
Resource   ../../keyword/Networking/kw_Wireless.robot



Test Setup   kw_Common.Login Web GUI
Test Teardown  kw_Common.End Test
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
    kw_Main_Menu.Open Newworking Wireless Page

Modify ssid
    kw_Wireless.Backup Previous SSID Value
    kw_Wireless.Set SSID Value      SSID_SET_TEST_1

Verify ssid has been changed
    kw_Wireless.Should SSID Value Be Equal      SSID_SET_TEST_1

Restore ssid to previous state
    kw_Wireless.Restore To Previous SSID Value

*** comment ***