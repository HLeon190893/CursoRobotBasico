*** Settings ***
Documentation  Tarefa 5 do Curso de Robot Basico
Library    String

*** Variables ***
&{PESSOA}  nome=Hugo  sobrenome=Medeiros

*** Test Cases ***
Caso de Teste: Tarefa 5 do Curso
    ${EMAIL_GERADO}    Subkeyword que gera e-mail aleatorio  ${PESSOA.nome}  ${PESSOA.sobrenome}
    Log    ${EMAIL_GERADO}

*** Keywords ***
Subkeyword que gera e-mail aleatorio
    [Arguments]    ${NOME}   ${SOBRENOME}
    ${STRING_ALETORIA}  Generate Random String
    ${EMAIL}    Set Variable    ${NOME}${SOBRENOME}${STRING_ALETORIA}@testerobot.com
    [Return]    E-Mail: ${EMAIL}