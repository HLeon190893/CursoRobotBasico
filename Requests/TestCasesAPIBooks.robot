*** Settings ***
Documentation    Documentação da API: https://fakerestapi.azurewebsites.net/
Resource         ResourceAPI.robot
Suite Setup      Conectar a minha API

*** Test Cases ***
Buscar listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o status code  200
    Conferir o reason  OK
    Conferir se retorna uma lista com "200" livros

Buscar um unico livro por ID (GET by ID de um livro)
    Requisitar o livro "15"
    Conferir o status code  200
    Conferir o reason  OK
    Conferir se retorna todos os dados corretos do livro 15

Cadastrar um novo livro
    Cadastrar Livro
    Conferir informaces do livro    5241    teste    teste    252    teste    2022-07-25T17:18:53.767Z
    Conferir o status code  200
    Conferir o reason  OK

Atualizar um Livro
    Atualizar o livro "20"
    Conferir informaces do livro    20    teste    teste    252    teste    2022-07-25T17:18:53.767Z
    Conferir o status code  200
    Conferir o reason  OK

Deletar um Livro
    Deletar o livro "201"
    Conferir o status code  200
    Conferir o reason  OK