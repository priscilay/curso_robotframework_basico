*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variable ***
 

*** Keywords ***

Criar um usuário novo
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case     ${palavra_aleatoria} 
    Set Test Variable    ${nome_teste}     ${palavra_aleatoria}   
    Set Test Variable    ${email_teste}    ${palavra_aleatoria}@emailtest.com
    Log     email aleatorio com letras minusculas setado em uma variavel ${email_teste}

Cadastrar o usuário criado na Serverest
    ${body}    Create Dictionary    
    ...        nome=${nome_teste}
    ...        email=${email_teste}
    ...        password="teste"
    ...        administrador=true
        Criar sessao da Serverest
        ${resposta}    POST On Session
        ...            alias=Serverest
        ...            url=/usuarios
        ...            json=${body}
        Log     ${resposta.json()}
        Set Test Variable   ${RESPOSTA}     ${resposta.json()}
        

Criar sessao da Serverest
    ${headers}  Create Dictionary    accept=application/json     Content-Type=application/json
    Create Session    alias=Serverest    url=https://serverest.dev/     headers=${headers}

Conferir se o usuário foi cadastrado corretamente
    Log     ${RESPOSTA} 
    Dictionary Should Contain Item     ${RESPOSTA}    message     Cadastro realizado com sucesso
    Dictionary Should Contain Key      ${RESPOSTA}    _id  
