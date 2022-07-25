*** Settings ***
Documentation   Suíte para exemplificar o uso de LOOPS nos testes
...             Os LOOPS devem ser pouco utilizados, mas tem hora que não tem jeito
...             e precisamos dele mesmo, então vamos ver como é!
...             LOOPS: use com moderação!
...             Infelizmente o Loop FOR ainda não tem uma estrutura keyword-driven
...             Mas o criador do Robot já disse que estão estudando uma solução!

*** Variable ***
@{LISTA_DE_FRUTAS}    maça  abacaxi  banana  morango  laranja  uva

*** Test Case ***
Teste repeat keyword
    [Documentation]  Chama uma mesma keyword varias vezes
    Usando repeat keyword

Teste de FOR do tipo IN RANGE=
    [Documentation]    Faz um loop dentro de um intervalo que você passar
    Usando FOR IN RANGE

Teste de FOR do tipo IN=
    [Documentation]    Faz um loop percorrendo a lista que você passar
    Usando FOR IN
Teste de FOR do tipo IN ENUMERATE=
    [Documentation]  Faz um loop percorrendo a lista que você passar e traz o indice junto
    Usando FOR IN ENUMERATE
Teste de Sair do FOR=
    [Documentation]  Controlando um FOR, saindo quando quiser
    Usando FOR IN com EXIT FOR LOOP IF
*** Keywords ***
Usando repeat keyword
    Log To Console    ${\n}
    Repeat Keyword    4    Log To Console    Minha repetição da keyword!

Usando FOR IN RANGE
    Log To Console    ${\n}
    FOR  ${CONTADOR}   IN RANGE  0   5
        Log To Console    Minha posição agora é: ${CONTADOR}
        Log    Minha posição agora é: ${CONTADOR}
    END

Usando FOR IN
    Log To Console    ${\n}
    FOR  ${FRUTA}  IN  @{LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${FRUTA}
    END

Usando FOR IN ENUMERATE
    Log To Console    ${\n}
    FOR  ${INDICE}  ${FRUTA}  IN ENUMERATE  @{LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${FRUTA}
        No Operation
    END

Usando FOR IN com EXIT FOR LOOP IF
    Log To Console    ${\n}
    FOR  ${INDICE}  ${FRUTA}  IN ENUMERATE  @{LISTA_DE_FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${FRUTA}
        Exit For Loop If    '${FRUTA}' == 'banana'
    END
