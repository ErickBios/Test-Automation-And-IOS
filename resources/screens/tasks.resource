*** Settings ***
Documentation            Elementos e ações da tela de login

Library    AppiumLibrary

*** Variables ***
${input_task_new}             xpath=//*[contains(@text, "nova tarefa")]
${create_button}              xpath=//*[@resource-id="createTask"]
*** Keywords ***
Create a new taks
    [Arguments]        ${task_name}

    Wait Until Element Is Visible   ${input_task_new}     15

    Input Text       ${input_task_new}     ${task_name}
    Click Element    ${create_button}   

Should have task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    
    ...     xpath=//*[@resource-id="taskText"][@text="${task_name}"]
    ...     10

Remove task by name
    [Arguments]    ${task_name}

    Click Element     xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]

    ${button_yes}  Set Variable  xpath=//android.widget.Button[@text="SIM"]

     Wait Until Element Is Visible        ${button_yes}  5
    Click Element                         ${button_yes}

finish task
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/..

Task should be done
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView
