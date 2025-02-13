*** Settings ***
Documentation        Suite de testes de cadastros

Resource    ${EXECDIR}/resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
     [Tags]    heppy
    ${tesk_name}     Set Variable    Estudar Python
    Remove task from database     ${tesk_name}
    
    Do login

    Create a new taks    ${tesk_name}
    Should have task     ${tesk_name}

Deve poder remover uma tarefa indesejada
    [Tags]    remove

    ${tesk_name}    Set Variable    Comprar refigerante
     Remove task from database     ${tesk_name}

     Do login
     Create a new taks    ${tesk_name}
     Should have task     ${tesk_name}

     Remove task by name                 ${tesk_name}
     Wait Until Page Does Not Contain    ${tesk_name}

Deve poder concluir uma tarefa indesejada
    [Tags]    done

    ${tesk_name}    Set Variable    Estudar todos os dias.
     Remove task from database     ${tesk_name}

     Do login
     Create a new taks    ${tesk_name}
     Should have task     ${tesk_name}

     finish task               ${tesk_name}
     Task should be done       ${tesk_name}
    


     




