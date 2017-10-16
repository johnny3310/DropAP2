*** Settings ***
Resource      ./base.robot


*** Variables ***
${Link_Configure_DropAP} =      xpath=/html/body/section/div[1]/div/a[2]
${Menu_Status} =       xpath=/html/body/div/div[2]/ul/li[1]/a
${Menu_Networking} =     xpath=/html/body/div/div[2]/ul/li[2]/a
${Link_Wireless} =      xpath=/html/body/div/div[2]/ul/li[2]/ul/li[3]/a
${Menu_Device_Management} =    xpath=/html/body/div/div[2]/ul/li[3]/a

*** Keywords ***

Open Status Manu
   cpe click   web      ${Menu_Status}
   sleep   2s

Open Newworking Wireless Page
    Wait Until Keyword Succeeds    10x    2s    click links    web    Networking  Wireless
#    Open Newworking Menu
#    Open Wireless Page

Open Newworking Menu
    cpe click   web  ${Menu_Networking}

Open Wireless Page
    cpe click   web  ${Link_Wireless}
    sleep  3s

Open Device Management


#Check Menu Is Active
#    [Arguments]     ${menu_link_locator}
#    ${class} =      Get Element Attribute