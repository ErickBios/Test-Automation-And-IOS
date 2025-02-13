*** Settings ***
Documentation            Elementos e ações da tela de login

Library    AppiumLibrary

*** Variables ***
${input_task_new}             accessibility_id=newTask
${create_button}              accessibility_id=createTask

*** Keywords ***
Create a new taks
    [Arguments]        ${task_name}

    Wait Until Element Is Visible   ${input_task_new}     15

    Input Text       ${input_task_new}     ${task_name}
    Click Element    ${create_button}
    #Plavra chave para fechar o teclado antes da ação primaria:
    Close keybord   

Should have task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    
    ...     xpath=//*[@name="taskText"][@value="${task_name}"]
    ...     10

Remove task by name
    [Arguments]    ${task_name}
       

    Click Element     xpath=//*[@text="${task_name}"]/../..//*[@name="removeTask"]

    ${button_yes}  Set Variable  xpath=//XCUIElementTypeButton[@name="Sim"]

     Wait Until Element Is Visible        ${button_yes}  5
    Click Element                         ${button_yes}

finish task
    [Arguments]    ${task_name}
    
    Click Element    xpath=//*[@value="${task_name}"]/..//*[@name="taskToo"]

Task should be done
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@value="${task_name}"]/..//*[@name="taskFinished"]

#Helprs "Caso eu precise fecha o teclado o iOS em outras camadas"
Close keybord
    ${return}    Set Variable    xpath=//XCUIElementTypeButton[@name="return"] 

    Wait Until Element Is Visible    ${return}     2
    Click Element                    ${return} 


