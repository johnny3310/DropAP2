*** Settings ***
Resource      libs/lib_index.robot
Resource      ../variable/var_Main_Menu.robot

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