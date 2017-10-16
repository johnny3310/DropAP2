*** Settings ***
Resource   ../base.robot


Test Setup   Login Web GUI
Test Teardown  Restore To Previous State
Force Tags  @FEATURE=Web_GUI    @AUTHOR=Johnny_Peng

*** Test Cases ***
tc_Wireless_Home Network_Security_And_Password
    [Documentation]   tc_Wireless_Home Network_Security_And_Password
    ...    1. Go to wireless home network page
    ...    2. Set a new Security and Password Value
    ...    3. Verify Security and Password have set


    [Tags]   @TCID=WRTM-326ACN-177    @DUT=WRTM-326ACN     @AUTHOR=Johnny_Peng    config_test     config_wireless
    [Timeout]
    Go To Wireless Home Network Page
    Set A New Security And Password Value
    Verify Security State Was Modifed


*** Keywords ***
Go To Wireless Home Network Page
    kw_Main_Menu.Open Newworking Wireless Page

Set A New Security And Password Value
    kw_Wireless.Backup Previous Security And Password State
    kw_Wireless.Set Security And Password   WEP    qwert

Verify Security State Was Modifed
    kw_Wireless.Verify Security And Password Were Set   WEP    qwert

Restore To Previous State
    kw_Wireless.Restore To Previous Security State

*** comment ***
2017-10-16     Johnny_Peng
Init the script
