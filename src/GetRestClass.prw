#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} GetRestClass
Exemplo de GET

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL GetRestClass DESCRIPTION "Exemplo de GET." FORMAT "application/json"

WSDATA pageSize         AS INTEGER   OPTIONAL
WSDATA page             AS INTEGER   OPTIONAL
WSDATA meuFiltro        AS CHARACTER OPTIONAL

WSMETHOD GET DESCRIPTION "Get simples com syntax" ;
    WSSYNTAX "/GetRestClass || /GetRestClass/{id}" ;
    PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configura��o.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSRECEIVE page, pageSize, meuFiltro WSSERVICE GetRestClass

Local lRet  as logical

// Path Param
If Len(::aURLParms) > 0
    //Trata-se de um Get espec�fico
    lRet := GetUnico(Self)
Else
    //Trata-se de um Get de lista
    lRet := GetLista(Self)
EndIf

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} GetUnico
Fun��o de busca de um �nico registro

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
Static Function GetUnico(oSelf)

Local lRet      as logical
Local cConteudo as character

cConteudo := "conteudo"//MinhaBusca(oSelf:aURLParms[1])

If Empty(cConteudo)
    SetRESTFault(1,"O registro n�o foi encontrado.",.T.,404)
    lRet := .F.
Else
    cConteudo := '{"' + oSelf:aURLParms[1] + '", "valor"}'//MinhaConversaoParaJson(cConteudo)
    oSelf:SetResponse(cConteudo)
    lRet := .T.
EndIf

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} GetLista
Fun��o de busca de uma lista de registros

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
Static Function GetLista(oSelf)

Local aConteudo as array
Local nX        as numeric

aConteudo := {"conteudo1","conteudo2","conteudo3"}//MinhaBuscaTudo(oSelf)

oSelf:SetResponse('{"Lista": [')

For nX := 1 To Len(aConteudo)
    oSelf:SetResponse('"' + aConteudo[nX] + If(nX < Len(aConteudo), '",', '"'))
Next nX

oSelf:SetResponse(']}')

Return .T.

//-------------------------------------------------------------------
/*/{Protheus.doc} MinhaBuscaTudo
Fun��o de busca de todos os registros

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
    //Aqui calculo a partir de qual registro devo come�ar a pegar
EndIf

//Aqui monto a lista de acordo com a configura��o enviada.

Return aConteudo
