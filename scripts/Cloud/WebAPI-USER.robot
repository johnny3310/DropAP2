*** Settings ***
Library           Collections
Library           RequestsLibrary


*** Variables ***
${domainName}      https://s5-dropap.securepilot.com
${apiKey}   DropAP-GFFnDFe4WM
${apiToken}     c37832b370ab9b51633ba20e2717f86435c37a95
${time}     20170925
${profile}  ${true}
${deviceId}     701a05010003
${deviceInfo}   {"name": "My Device"}
${deviceInfoNew}    {"name": "My Device test"}
${pin}      18833648

*** Test Cases ***
Login and Get Info (S5)-User
    [Tags]    get
    ${auth}=    Create list    jennie    12345678
    ${apiKey}=    Create list    DropAP-GFFnDFe4WM
    ${domainName}=    Set Variable    https://s5-dropap.securepilot.com
    ${apiToken}=    Create list    c37832b370ab9b51633ba20e2717f86435c37a95
    ${service}    Create list    MSG
    #user login api
    Create Digest Session    S5    ${domainName}    ${auth}    debug=3
    ${resp}=    Get Request    S5    /v1/user/login
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['status']['code']}    1211
    Delete All Sessions
    #get user info
    Create Session    S5    ${domainName}
    ${data} =    Create Dictionary    token=${resp.json()['global_session']['token']}    api_key=${apiKey}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp1}=    Post Request    S5    /v1/user/get_info    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp1.status_code}    200
    Should Be Equal As Strings    ${resp1.json()['status']['code']}    1211
    Delete All Sessions
    #get service all
    Create Session    S5    ${domainName}
    ${data} =    Create Dictionary    token=${resp.json()['global_session']['token']}    api_key=${apiKey}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp2}=    Post Request    S5    /v1/user/get_service_all    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp2.status_code}    200
    Should Be Equal As Strings    ${resp2.json()['status']['code']}    1200
    Delete All Sessions
    #get service info
    Create Session    S5    ${domainName}
    ${data} =    Create Dictionary    token=${resp.json()['global_session']['token']}    api_key=${apiKey}    info=${resp2.json()}    service=${service}
    Log    ${data}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp3}=    Post Request    S5    /v1/user/get_service_info    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp3.status_code}    200
    Log    ${resp2.json()}
    Should Be Equal As Strings    ${resp3.json()['status']['code']}    1211

Update user information(S5)
    [Tags]    get
    ${auth}=    Create list    jennie    12345678
    ${auth_change}=    Create list    12345678
    ${apiKey}=    Create list    DropAP-GFFnDFe4WM
    ${domainName}=    Set Variable    https://s5-dropap.securepilot.com
    ${apiToken}=    Create list    c37832b370ab9b51633ba20e2717f86435c37a95
    #user login api
    Log    '#User Login API'
    Create Digest Session    S5    ${domainName}    ${auth}    debug=3
    ${resp}=    Get Request    S5    /v1/user/login
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['status']['code']}    1211
    Delete All Sessions
    #get user info
    Create Session    S5    ${domainName}
    ${data} =    Create Dictionary    token=${resp.json()['global_session']['token']}    api_key=${apiKey}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp1}=    Post Request    S5    /v1/user/get_info    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp1.status_code}    200
    Should Be Equal As Strings    ${resp1.json()['status']['code']}    1211
    Delete All Sessions
    #Edit user info
    Create Session    S5    ${domainName}
    ${data} =    Create Dictionary    token=${resp.json()['global_session']['token']}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp2}=    Put request    S5    /v1/user/edit_info    data=${data}    headers=${headers}
    Log    ${data}
    Should Be Equal As Strings    ${resp2.status_code}    200
    Should Be Equal As Strings    ${resp2.json()['status']['code']}    1213
    Delete All Sessions
    #get user info
    Create Session    S5    ${domainName}
    ${data} =    Create Dictionary    token=${resp.json()['global_session']['token']}    api_key=${apiKey}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp1}=    Post Request    S5    /v1/user/get_info    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp1.status_code}    200
    Should Be Equal As Strings    ${resp1.json()['status']['code']}    1211
    Delete All Sessions
    #Edit user infro
    Create Session    S5    ${domainName}
    ${data} =    Create Dictionary    token=${resp.json()['global_session']['token']}    api_key=${apiKey}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp2}=    Put request    S5    /v1/user/edit_info    data=${data}    headers=${headers}
    Log    ${data}
    Should Be Equal As Strings    ${resp2.status_code}    200
    Should Be Equal As Strings    ${resp2.json()['status']['code']}    1213
    Delete All Sessions
    #get user info
    Create Session    S5    ${domainName}
    ${data} =    Create Dictionary    token=${resp.json()['global_session']['token']}    api_key=${apiKey}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp1}=    Post Request    S5    /v1/user/get_info    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp1.status_code}    200
    Should Be Equal As Strings    ${resp1.json()['status']['code']}    1211
    Delete All Sessions

change password
    ${Old_auth}=    Create list    jennie    12345678
    ${New_auth}=    Create list    jennie    12345678AA
    ${apiKey}=    Create list    DropAP-GFFnDFe4WM
    ${domainName}=    Set Variable    https://s5-dropap.securepilot.com
    ${apiToken}=    Create list    c37832b370ab9b51633ba20e2717f86435c37a95
    #Change New Pasword
    Create Digest Session    S5    ${domainName}    ${Old_auth}    debug=3
    ${data}=    Create Dictionary    new_pwd=12345678AA
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    S5    /v1/user/pwd_change    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['status']['code']}    1213
    ${resp}=     To Json     ${resp.content}
    Delete All Sessions
    Sleep    1
    #Change Password again
    Create Digest Session    S5    ${domainName}    ${New_auth}    debug=3
    ${data}=    Create Dictionary    new_pwd=12345678
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    S5    /v1/user/pwd_change    data=${data}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['status']['code']}    1213
    ${resp}=     To Json     ${resp.content}
    Delete All Sessions
    #user login api
    Create Digest Session    S5    ${domainName}    ${Old_auth}    debug=3
    ${resp}=    Get Request    S5    /v1/user/login
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()['status']['code']}    1211
    Delete All Sessions


Bind/unbind device and edit info
    [Tags]    Bind/unbind device and edit info
    ${auth}=    Create List    jill_test    12345678
    Create Digest Session    S5    ${domainName}    auth=${auth}    debug=3
    ${resp1}=    Get Request    S5    /v1/user/login
    Should Be Equal As Strings    ${resp1.status_code}    200
    Should Be Equal As Strings    ${resp1.json()['status']['code']}    1211
    Delete All Sessions

    Create Session  S5  ${domainName}
    ${data}   Create Dictionary   token=${resp1.json()['global_session']['token']}     api_key=${apiKey}    api_token=${apiToken}   time=${time}    profile=${profile}
    ${headers}   Create Dictionary   Content-Type=application/json
    ${resp}  Post Request      S5      /v1/user/get_device_list    headers=${headers}      data=${data}
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings    ${resp.json()['status']['code']}      1232
    Should Be Equal As Strings    ${resp.json()['device_list']}      	[]
    Delete All Sessions

    Create Session  S5  ${domainName}
    ${data}   Create Dictionary   token=${resp1.json()['global_session']['token']}     api_key=${apiKey}    api_token=${apiToken}   time=${time}   level=0     device_id=${deviceId}   pin=${pin}      device_info=${deviceInfo}
    ${headers}   Create Dictionary   Content-Type=application/json
    ${resp2}  Post Request      S5      /v1/user/add_device    headers=${headers}      data=${data}
    Should Be Equal As Strings  ${resp2.status_code}  200
    Should Be Equal As Strings    ${resp2.json()['status']['code']}      1231
    Delete All Sessions

    Create Session  S5  ${domainName}
    ${data}   Create Dictionary   token=${resp1.json()['global_session']['token']}     api_key=${apiKey}    api_token=${apiToken}   time=${time}    profile=${profile}
    ${headers}   Create Dictionary   Content-Type=application/json
    ${resp}  Post Request      S5      /v1/user/get_device_list    headers=${headers}      data=${data}
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings    ${resp.json()['status']['code']}      1232
    Should Be Equal As Strings    ${resp.json()['device_list'][0]['mac']}      	701a05010003
    Delete All Sessions

    Create Session  S5  ${domainName}
    ${data}   Create Dictionary   token=${resp1.json()['global_session']['token']}     api_key=${apiKey}    api_token=${apiToken}   time=${time}   device_id=${resp.json()['device_list'][0]['gid']}   device_info=${deviceInfoNew}
    ${headers}   Create Dictionary   Content-Type=application/json
    ${resp2}  Post Request      S5      /v1/user/edit_device    headers=${headers}      data=${data}
    Should Be Equal As Strings  ${resp2.status_code}  200
    Should Be Equal As Strings  ${resp2.json()['status']['code']}    1213
    Delete All Sessions

    Create Session  S5  ${domainName}
    ${data}   Create Dictionary   token=${resp1.json()['global_session']['token']}     api_key=${apiKey}    api_token=${apiToken}   time=${time}    profile=${profile}
    ${headers}   Create Dictionary   Content-Type=application/json
    ${resp}  Post Request      S5      /v1/user/get_device_list    headers=${headers}      data=${data}
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings    ${resp.json()['status']['code']}      1232
    Should Be Equal As Strings    ${resp.json()['device_list'][0]['mac']}      	701a05010003
    Should Be Equal As Strings    ${resp.json()['device_list'][0]['name']}      My Device test

    Delete All Sessions

    Create Session  S5  ${domainName}
    ${data}   Create Dictionary   token=${resp1.json()['global_session']['token']}     api_key=${apiKey}    api_token=${apiToken}   time=${time}   device_id=${deviceId}
    ${headers}   Create Dictionary   Content-Type=application/json
    ${resp2}  Post Request      S5      /v1/user/rm_device    headers=${headers}      data=${data}
    Should Be Equal As Strings  ${resp2.status_code}  200
    Should Be Equal As Strings  ${resp2.json()['status']['code']}    1234
    Delete All Sessions

    Create Session  S5  ${domainName}
    ${data}   Create Dictionary   token=${resp1.json()['global_session']['token']}     api_key=${apiKey}    api_token=${apiToken}   time=${time}    profile=${profile}
    ${headers}   Create Dictionary   Content-Type=application/json
    ${resp}  Post Request      S5      /v1/user/get_device_list    headers=${headers}      data=${data}
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings    ${resp.json()['status']['code']}      1232
    Should Be Equal As Strings    ${resp.json()['device_list']}      	[]
    Delete All Sessions

