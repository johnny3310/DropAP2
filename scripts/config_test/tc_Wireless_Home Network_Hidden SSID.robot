*** Settings ***
Resource   ../../keyword/kw_Common.robot
Resource   ../../keyword/kw_Main_Menu.robot
Resource   ../../keyword/Networking/kw_Wireless.robot



Test Setup   kw_Common.Login Web GUI
Test Teardown  Restore Hidden SSID Check Box To Previous State
Force Tags  @AUTHOR=Gemtek_Johnny_Peng

*** Test Cases ***
tc_Wireless_Home Network_Hidden SSID
    [Documentation]   tc_Wireless_Home Network_Hidden SSID
    ...    1. Go to wireless home network page
    ...    2. Make Hidden SSID Check Box Checked
    ...    3. Verify Hidden SSID Check Box is Checked


    [Tags]   config_test     modify_ssid
    [Timeout]
    Go to wireless home network page
    Make Hidden SSID Check Box Checked
    Verify Hidden SSID Check Box Is Checked



*** Keywords ***
Go to wireless home network page
    kw_Main_Menu.Open Newworking Wireless Page

Make Hidden SSID Check Box Checked
    kw_Wireless.Backup Previous Checkbox Hidden SSID State
    kw_Wireless.Set Hidden SSID Checkbox to Checked

Verify Hidden SSID Check Box Is Checked
    kw_Wireless.Verify Hidden SSID Checkbox is Checked

Restore Hidden SSID Check Box To Previous State
    kw_Wireless.Restore To Previous Checkbox Hidden SSID State

*** comment ***
