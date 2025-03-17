*** Settings ***
Library           AppiumLibrary
# Library    Browser

Resource      ../Resources/variables.robot

*** Keywords ***
I Open api_debug
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=${AUTOMATION_NAME}

I go on hyperspace
    Sleep    3s
    Click Element    //android.widget.TextView[@content-desc="Views"]
    Click Element    //android.widget.TextView[@content-desc="Animation"]
    Click Element    //android.widget.TextView[@content-desc="Push"]
    Click Element    io.appium.android.apis:id/spinner
    Click Element    //android.widget.CheckedTextView[@resource-id="android:id/text1"]

The result should be the expected result
    wait until element is visible    //android.widget.TextView[@content-desc="a chance to be better."]
        ${text1}=    Get Text    //android.widget.TextView[@content-desc="a chance to be better."]
        Should Be Equal As Strings    ${text1}    a chance to be better.
        Log To Console    Le texte doit être ${text1}

    wait until element is visible    //android.widget.TextView[@content-desc="— Albert Camus"]
        ${text2}=    Get Text    //android.widget.TextView[@content-desc="— Albert Camus"]
        Should Be Equal As Strings    ${text2}    — Albert Camus
        Log To Console    Le texte doit être ${text2}
    
    wait until element is visible    //android.widget.TextView[@content-desc="is nothing else but"]
        ${text3}=    Get Text    //android.widget.TextView[@content-desc="is nothing else but"]
        Should Be Equal As Strings    ${text3}    is nothing else but
        Log To Console    Le texte doit être ${text3}
    
        sleep    10s
    wait until element is visible    //android.widget.TextView[@content-desc="Freedom"]
        ${text4}=    Get Text    //android.widget.TextView[@content-desc="Freedom"]
        Should Be Equal As Strings    ${text4}    Freedom
        Log To Console    Le texte doit être ${text4}



I launch Chronometer
    Sleep    2s
    Click Element    //android.widget.TextView[@content-desc="Views"]
    Click Element    //android.widget.TextView[@content-desc="Chronometer"]
    Click Element    //android.widget.Button[@content-desc="Start"]


I change the format
    Sleep    2s
    Click Element    io.appium.android.apis:id/set_format

    
The chronometer should still be running

    ${chrono1}=    Get Text    //android.widget.Chronometer[@resource-id="io.appium.android.apis:id/chronometer"]
    Log To Console    Le timer doit être ${chrono1}
    Sleep    2s
    ${chrono2}=    Get Text    //android.widget.Chronometer[@resource-id="io.appium.android.apis:id/chronometer"]
    Log To Console    Le timer doit être ${chrono2}

    Should Not Be Equal As Strings    ${chrono1}    ${chrono2}
    Log To Console    Le chronomètre tourne toujours


I scroll to seek bar
    Sleep    2s
    Click Element    //android.widget.TextView[@content-desc="Views"]
    Swipe    start_x=600    start_y=2600    offset_x=600    offset_y=500
    Sleep    2s 
    Click Element    //android.widget.TextView[@content-desc="Seek Bar"]

I set seek bar to 88
    Sleep    2s
    Click Element    //android.widget.SeekBar[@resource-id="io.appium.android.apis:id/seek"]
    Input Text    //android.widget.SeekBar[@resource-id="io.appium.android.apis:id/seek"]    88
    
The seek bar should be at 88
    Sleep    2s
    ${curseur}=    Get Text    //android.widget.TextView[@resource-id="io.appium.android.apis:id/progress"]
    Should Be Equal As Strings    ${curseur}    88 from touch=true
    Log To Console    La valeur ${curseur} est la bonne : 88

