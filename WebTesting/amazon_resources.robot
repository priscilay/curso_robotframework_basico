*** Settings ***
Library  SeleniumLibrary

*** Variable ***
${BROWSER}                           chrome
${URL}                               https://www.amazon.com.br/
${MENU_MAIS_VENDIDOS}                //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${HEADER_MAIS_VENDIDOS}              //h1[contains(.,'Mais Vendidos')]
${TEXTO_HEADER_MAIS_VENDIDOS}        Mais Vendidos
# ${CATEGORIA_MAIS_VENDIDOS_COZINHA}   //h2[contains(.,'Mais Vendidos em Livros')]

*** Keywords ***

Abrir o navegador
    Open Browser                browser=${BROWSER}
    Maximize Browser Window      
options=add_experimental_option("detach", True)

Fechar o navegador
    Capture Page Screenshot
    Capture Element Screenshott
    Close Browser  
 
Acessar a home page do site Amazon.com.br
    Go To                          url=${URL}    
    Wait Until Element Is Visible  locator=${MENU_MAIS_VENDIDOS}

Entrar no menu "Mais Vendidos"     
    Click Element                  locator=${MENU_MAIS_VENDIDOS}

Verificar se o título da página fica "${TITULO}"
    Page Should Contain Element    locator=${HEADER_MAIS_VENDIDOS}  
    Wait Until Page Contains       text=${TEXTO_HEADER_MAIS_VENDIDOS}
    Title Should Be                title=${TITULO}  

Verificar se aparece a categoria "${CATEGORIA}" 
    # Execute JavaScript    window.scrollBy(0,1500)
    Wait Until Page Contains       text=${CATEGORIA}

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox   text=${PRODUTO}    

Clicar no botão de pesquisa
    Click Element  locator=nav-search-submit-button    

Verificar o resultado da pesquisa é o produto "${PRODUTO}"
    Wait Until Element Is Visible   locator=//span[contains(.,'${PRODUTO}')]
    