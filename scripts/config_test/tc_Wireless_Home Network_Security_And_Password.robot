*** Settings ***
Resource   ../../keyword/kw_Common.robot
Resource   ../../keyword/kw_Main_Menu.robot
Resource   ../../keyword/Networking/kw_Wireless.robot


Test Setup   kw_Common.Login Web GUI
Test Teardown  Restore To Previous State
Force Tags  @AUTHOR=Gemtek_Johnny_Peng

*** Test Cases ***
tc_Wireless_Home Network_Security_And_Password
    [Documentation]   tc_Wireless_Home Network_Security_And_Password
    ...    1. Go to wireless home network page
    ...    2. Set a new Security and Password Value
    ...    3. Verify Security and Password have set


    [Tags]   config_test     modify_security
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
    kw_Wireless.Verify Security And Password Were Set

Restore To Previous State
    kw_Wireless.Restore To Previous Security State

*** comment ***
