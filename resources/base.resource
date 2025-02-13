***Settings***
Documentation                    Tudo deve começa nesse arquivo

Library    AppiumLibrary
Library    libs/mongo.py

Resource    screens/login.resource
Resource    screens/tasks.resource

*** Keywords ***
Start session

    Open Application    http://localhost:4723
    ...                 automationName=uiautomator2
    ...                 platformName=Android
    ...                 deviceName=emulator
    ...                 udid=emulator-5554
    ...                 autoGranPermissions=true
    ...                 app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    text=Endereço IP da Api    timeout=10

Finish session
    Capture Page Screenshot
    Close Application