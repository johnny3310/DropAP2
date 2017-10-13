*** Variables ***
${Input_SSID} =     css=input[id="cbid.wireless.ra0.ssid"]
${Checkbox_Hidden_SSID} =      id=cbid.wireless.ra0.hidden
${Select_Security}=    css=select[id="cbid.wireless.ra0.encryption"]
${Input_Password}=     css=input[id="cbid.wireless.ra0._wepkey"]
${Button_SAVE} =    xpath=/html/body/div/div[3]/div[2]/div/form/div[3]/input[1]

${Previous_SSID} =
${Previous_Checkbox_Hidden_SSID_State}=
${Previous_Select_Security}=
${Previous_Input_Password}=