*** Settings ***
Documentation    Essa suite testa o site da amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

#Suite Setup     inicia antes da suite inteira
#Suite Teardown  finaliza a suite inteira

*** Test Cases ***

Caso de teste 1 - Acesso ao menu "Mais Vendidos"
    [Documentation]   Esse teste verifica o menu "Mais Vendidos" do site da Amazon.com.br
    ...               e verifica a categoria "Mais Vendidos em Moda"
    # [Tags]            menus  categorias
    Acessar a home page do site Amazon.com.br 
    # Entrar no menu "Mais Vendidos"
    # Verificar se o título da página fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
    # Verificar se aparece a categoria "Mais Vendidos em Livros"
    # Verificar se aparece a categoria "Mais Vendidos em Brinquedos e Jogos"
    
Caso de teste 2 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    # [Tags]             busca_produtos  lista_busca  
    # Acessar a home page do site Amazon.com.br
    # Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    # Clicar no botão de pesquisa
    # Verificar o resultado da pesquisa é o produto "Xbox Series S"
# 
    # robot -d resultados amazon_testing.robot --cria pasta para evidencias de suite de testes
    # robot -v BROWSER:firefox -i menus -d resultados amazon_testing.robot -- combinacoes de variaveis na linha de comando