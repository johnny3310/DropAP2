*** Settings ***
Resource     libs/lib_index.robot
Resource     var_Front_Page.robot

*** Keywords ***
Head to Configure DropAP
     cpe click    web    ${Link_Configure_DropAP}
#     log     ${Link_Configure_DropAP}
     sleep  2s



