*** Settings ***
Resource   base.robot



Test Setup   Login Web GUI
Test Teardown  Restore To Previous State
Force Tags  @FEATURE=Web_GUI    @AUTHOR=Johnny_Peng

*** Test Cases ***
tc_Wireless_Home Network_Hidden SSID
    [Documentation]   tc_Wireless_Home Network_Hidden SSID
    ...    1. Go to wireless home network page
    ...    2. Make Hidden SSID Check Box Checked
    ...    3. Verify Hidden SSID Check Box is Checked


    [Tags]   @TCID=WRTM-326ACN-178    @DUT=WRTM-326ACN     @AUTHOR=Johnny_Peng    config_test     config_wireless
    [Timeout]
    Go to wireless home network page
    Make Hidden SSID Check Box Checked
    Verify Hidden SSID Check Box Is Checked



*** Keywords ***
Go to wireless home network page
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    kw_Main_Menu.Open Newworking Wireless Page

Make Hidden SSID Check Box Checked
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
#    kw_Wireless.Backup Current Checkbox Hidden SSID State
    kw_Wireless.Set Hidden SSID Checkbox to Checked

Verify Hidden SSID Check Box Is Checked
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    kw_Wireless.Verify Hidden SSID Checkbox is Checked

Restore To Previous State
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    kw_Wireless.Reset To Default Checkbox Hidden SSID State

*** comment ***
2017-10-16     Johnny_Peng
Init the script