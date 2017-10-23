*** Settings ***
Resource          ../base.robot
Resource          ./P800_kw.robot
Library           Collections
#Library           Selenium2Library

#import gui  keywords
Resource    keyword/kw_Common.robot
Resource    keyword/kw_Main_Menu.robot
Resource    keyword/Device_Management/kw_Firmware.robot
Resource    keyword/Device_Management/kw_System.robot
Resource    keyword/Device_Management/kw_Reboot_Reset.robot
Resource    keyword/Networking/kw_Diagnostics.robot
Resource    keyword/Networking/kw_Internet_Connection.robot
Resource    keyword/Networking/kw_Wireless.robot
Resource    keyword/Networking/kw_Wireless_Extender.robot
Resource    keyword/Status/kw_DMS.robot
Resource    keyword/Status/kw_Overview.robot
