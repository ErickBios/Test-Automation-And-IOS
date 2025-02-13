***Settings***
Documentation                    Tudo deve começa nesse arquivo

Library    AppiumLibrary
Library    libs/mongo.py

Resource    env.resource

Resource    screens/${PLATFORM}/login.resource
Resource    screens/${PLATFORM}/tasks.resource

*** Keywords ***
Start session
    
    Run Keyword If        '${PLATFORM}' =='android'
    ...                 Open Application    http://localhost:4723
    ...                 automationName=uiautomator2
    ...                 platformName=Android
    ...                 deviceName=emulator
    ...                 udid=emulator-5554
    ...                 autoGranPermissions=true
    ...                 app=${EXECDIR}/apps/markx.apk

    Run Keyword If      '${PLATFORM}' =='ios'

    ...                 Open Application    http://localhost:4723
    ...                 automationName=XCUITest
    ...                 platformName=ios
    ...                 deviceName=iPhone 14 Pro
    ...                 udid=6BCD0847-4AA2-42BB-B614-E1EFB2A65C8
    ...                 autoAcceptedAlerts=true
    ...                 app=${EXECDIR}/apps/markX.app
    ...                 platformVersion=16.4
    ...                 bundleId=com.qaxperience.markx


    Wait Until Page Contains    text=Endereço IP da Api    timeout=10

Finish session
    Capture Page Screenshot
    Close Application