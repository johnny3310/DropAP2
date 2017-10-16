*** Settings ***
Resource   base.robot




Test Setup   Login Web GUI
Test Teardown  Restore Guest Network SSID To Previous State
Force Tags    @FEATURE=Web_GUI    @AUTHOR=Johnny_Peng

*** Test Cases ***
tc_Wireless_Guest Network_On_Off
    [Documentation]   tc_Wireless_Home Network_Hidden SSID
    ...    1. Go to wireless home network page
    ...    2. Modify Guest Network SSID
    ...    3. Verify Guest Network SSID was set


    [Tags]   @TCID=WRTM-326ACN-172    @DUT=WRTM-326ACN     @AUTHOR=Johnny_Peng     config_test     config_wireless
    [Timeout]
    Go To Wireless Home Network Page
    Modify Guest Network SSID
    Verify Guest Network SSID was set


*** Keywords ***
Go to wireless home network page
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    kw_Main_Menu.Open Newworking Wireless Page

Modify Guest Network SSID
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    kw_Wireless.Backup Current Guest Network SSID
    kw_Wireless.Set Guest Network SSID  TEST_GUEST_NETWORK_SSID

Verify Guest Network SSID was set
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    kw_Wireless.Guest Network SSID Should Be   TEST_GUEST_NETWORK_SSID

Restore Guest Network SSID To Previous State
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    kw_Wireless.Restore Guest Network SSID

*** comment ***
2017-10-16     Johnny_Peng
Init the script