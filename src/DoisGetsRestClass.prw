#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} DoisGetsRestClass
Exemplo com dois GETs

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL DoisGetsRestClass DESCRIPTION "Exemplo com dois GETs." FORMAT "application/json"

WSDATA pageSize         AS INTEGER   OPTIONAL
WSDATA page             AS INTEGER   OPTIONAL
WSDATA meuFiltro        AS CHARACTER OPTIONAL

WSMETHOD GET UM DESCRIPTION "Get específico com path e syntax." ;
    WSSYNTAX "/DoisGetsRestClass" ;
    PATH "" ;
    PRODUCES APPLICATION_JSON

WSMETHOD GET LISTA DESCRIPTION "Get lista com path e syntax." ;
    WSSYNTAX "/DoisGetsRestClass/{id}" ;
    PATH "/{id}" ;
    PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET UM
Get específico com path e syntax.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET UM WSSERVICE DoisGetsRestClass

Local lRet      as logical
Local cConteudo as character

cConteudo := "conteudo"//MinhaBusca(::Self:aURLParms[1])

If Empty(cConteudo)
    SetRESTFault(1,"O registro não foi encontrado.",.T.,404)
    lRet := .F.
Else
    cConteudo := '{"' + ::Self:aURLParms[1] + '", "valor"}'//MinhaConversaoParaJson(cConteudo)
    ::Self:SetResponse(cConteudo)
    lRet := .T.
EndIf

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} GET LISTA
Get lista com path e syntax.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET LISTA WSRECEIVE page, pageSize, meuFiltro WSSERVICE DoisGetsRestClass

Local aConteudo as array
Local nX        as numeric

aConteudo := {"conteudo1","conteudo2","conteudo3"}//MinhaBuscaTudo(::Self)

::Self:SetResponse('{"Lista": [')

For nX := 1 To Len(aConteudo)
    ::Self:SetResponse('"' + aConteudo[nX] + If(nX < Len(aConteudo), '",', '"'))
Next nX

::Self:SetResponse(']}')

Return .T.

//-------------------------------------------------------------------
/*/{Protheus.doc} GetLista
Função de busca de uma lista de registros

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
Static Function MinhaBuscaTudo(oSelf)

Local aConteudo as array

If oSelf:meuFiltro <> Nil
    // Aqui aplico o filtro antes da fazer a consulta
EndIf

If oSelf:pageSize <> Nil
    //Aqui limito a quantidade de itens
EndIf

If oSelf:page <> Nil
    //Aqui calculo a partir de qual registro devo começar a pegar
EndIf

//Aqui monto a lista de acordo com a configuração enviada.

Return aConteudo
