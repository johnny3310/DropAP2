*** Settings ***
Resource   ../base.robot




Test Setup   Login Web GUI
Test Teardown  Restore Guest Network Radio To Default
Force Tags    @FEATURE=Web_GUI    @AUTHOR=Johnny_Peng


*** Test Cases ***
tc_Wireless_Guest Network_On_Off
    [Documentation]   tc_Wireless_Home Network_Hidden SSID
    ...    1. Go to wireless home network page
    ...    2. Set Guest Network Radio
    ...    3. Verify Guest Network Radio was set


    [Tags]   @TCID=WRTM-326ACN-179    @DUT=WRTM-326ACN     @AUTHOR=Johnny_Peng     config_test     config_wireless
    [Timeout]
    Go To Wireless Home Network Page
    Set Guest NetWork Raidio
    Verify Guest NetWork Radio Was Set


*** Keywords ***
Go to wireless home network page
    kw_Main_Menu.Open Newworking Wireless Page

Set Guest Network Raidio
    kw_Wireless.Set Guest Network Radio State   on
Verify Guest NetWork Radio Was Set
    kw_Wireless.Guest Network Radio Should Be   on
Restore Guest Network Radio To Default
    kw_Wireless.Set Guest Network Radio State   off

*** comment ***
2017-10-16     Johnny_Peng
Init the script