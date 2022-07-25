*** Settings ***
Library          RequestsLibrary
Library          Collections

*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}    Id=15
...           Title=Book 15
...           Description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n
...           Page_Count=1500
...           Excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\nLorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.\n

*** Keywords ***
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}

Requisitar todos os livros
    ${RESPOSTA}    GET On Session    fakeAPI    Books
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    GET On Session    fakeAPI    Books/${ID_LIVRO}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar Livro
    ${HEADERS}     Create Dictionary    content-type=application/json
    ${RESPOSTA}    POST On Session    fakeAPI    Books    
    ...            data={"id": 5241,"title": "teste","description": "teste","pageCount": 252,"excerpt": "teste","publishDate": "2022-07-25T17:18:53.767Z"}
    ...            headers=${HEADERS}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Atualizar o livro "${ID_LIVRO}"
    ${HEADERS}     Create Dictionary    content-type=application/json
    ${RESPOSTA}    PUT On Session   fakeAPI    Books/${ID_LIVRO}    
    ...            data={"id": ${ID_LIVRO},"title": "teste","description": "teste","pageCount": 252,"excerpt": "teste","publishDate": "2022-07-25T17:18:53.767Z"}
    ...            headers=${HEADERS}
    Log    ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Deletar o livro "${ID_LIVRO}"
    ${RESPOSTA}    DELETE On Session    fakeAPI    Books/${ID_LIVRO}
    Log    ${RESPOSTA}
    Set Test Variable    ${RESPOSTA}

#### Conferencias ####
Conferir o status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}    ${QTDE_LIVROS}

Conferir se retorna todos os dados corretos do livro 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id    ${BOOK_15.Id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title    ${BOOK_15.Title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description    ${BOOK_15.Description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount    ${BOOK_15.Page_Count}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt   ${BOOK_15.Excerpt}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]}

Conferir informaces do livro
    [Arguments]    ${ID_LIVRO}    ${TITLE_LIVRO}    ${DESCRIPTION_LIVRO}    ${PAGECOUNT_LIVRO}    ${EXCERPT_LIVRO}    ${PUBLISHDATE_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id    ${ID_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title    ${TITLE_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description    ${DESCRIPTION_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount    ${PAGECOUNT_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt   ${EXCERPT_LIVRO}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate   ${PUBLISHDATE_LIVRO}