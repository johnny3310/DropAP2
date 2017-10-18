*** Settings ***
Resource      ./base.robot


*** Variables ***
${Link_Configure_DropAP} =      xpath=/html/body/section/div[1]/div/a[2]
${Menu_Status} =       xpath=/html/body/div/div[2]/ul/li[1]/a
${Menu_Networking} =     xpath=/html/body/div/div[2]/ul/li[2]/a
${Link_Wireless} =      xpath=/html/body/div/div[2]/ul/li[2]/ul/li[3]/a
${Menu_Device_Management} =    xpath=/html/body/div/div[2]/ul/li[3]/a
${Link_Setup_DropAP} =      xpath=//*[@id="btn-setup"]

*** Keywords ***


Open Newworking Wireless Page
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    Wait Until Keyword Succeeds    10x    1s    click links    web     Networking    Wireless


Refresh Networking Wireless Page
    [Documentation]
    [Tags]   @AUTHOR=Johnny_Peng
    Wait Until Keyword Succeeds    10x    1s    click links    web    Wireless




*** comment ***
2017-10-18  Johnny_Peng
add key word:Refresh Networking Wireless Page

2017-10-16     Johnny_Peng
Init the script