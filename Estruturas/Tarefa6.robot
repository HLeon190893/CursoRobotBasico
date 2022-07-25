*** Settings ***
Documentation  Tarefa 6 do Curso de Robot Basico

*** Variables ***
@{LISTA_DE_NUMEROS}  1  2  3  4  5  6  7  8  9  10

*** Test Cases ***
Imprimindo numeros usando FOR e verificando se e 5 ou 10
    [Documentation]  Percorre a lista e diz se o numero é o 5 ou o 10
    Percorrendo a lista com FOR e verificando com IF

*** Keywords ***
Percorrendo a lista com FOR e verificando com IF
    Log To Console    ${\n}
    FOR  ${NUMERO}  IN  @{LISTA_DE_NUMEROS}
        IF   ${NUMERO} == 5
            Log To Console    Eu sou o número ${NUMERO}!
        ELSE IF  ${NUMERO} == 10
            Log To Console    Eu sou o número ${NUMERO}!
        ELSE
            Log To Console    Eu não sou o numero 5 e nem o 10! Mas eu sou o ${NUMERO}!
        END
    END
