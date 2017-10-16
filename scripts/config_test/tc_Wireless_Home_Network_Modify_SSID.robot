*** Settings ***
Resource   ../base.robot



Test Setup   Login Web GUI
Test Teardown  Restore ssid to previous state
Force Tags  @FEATURE=Web_GUI    @AUTHOR=Johnny_Peng

*** Test Cases ***
tc_Wireless_Home_Network_Modify_SSID
    [Documentation]   tc_Wireless_Home_Network_Modify_SSID
    ...    1. Go to wireless home network page
    ...    2. Modify ssid
    ...    3. verify ssid has been changed


    [Tags]   @TCID=WRTM-326ACN-176    @DUT=WRTM-326ACN     @AUTHOR=Johnny_Peng    config_test     config_wireless
    [Timeout]
    Go to wireless home network page
    Modify ssid
    Verify ssid has been changed



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
2017-10-16     Johnny_Peng
Init the script