*** Settings ***
Resource     ../resources/api_testing_usuarios.resource

*** Variables ***


*** Test Cases ***

Cenario 01: Cadastrar um novo usuário com sucesso da Serverest
    Criar um usuário novo
    Cadastrar o usuário criado na Serverest
    Conferir se o usuário foi cadastrado corretamente