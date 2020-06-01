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

WSMETHOD GET DESCRIPTION "Get simples sem nenhuma configuração." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSSERVICE GetRestClass

Local lRet  as logical

// Path Param
If Len(::aURLParms) > 0
    //Trata-se de um Get específico
    lRet := GetUnico(Self)
Else
    //Trata-se de um Get de lista
    lRet := GetLista(Self)
EndIf

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} GetUnico
Função de busca de um único registro

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
Static Function GetUnico(oSelf)

Local lRet      as logical
Local cConteudo as character

cConteudo := "conteudo"//MinhaBusca(oSelf:aURLParms[1])

If Empty(cConteudo)
    SetRESTFault(1,"O registro não foi encontrado.",.T.,404)
    lRet := .F.
Else
    cConteudo := '{"' + oSelf:aURLParms[1] + '", "valor"}'//MinhaConversaoParaJson(cConteudo)
    oSelf:SetResponse(cConteudo)
    lRet := .T.
EndIf

Return lRet

//-------------------------------------------------------------------
/*/{Protheus.doc} GetLista
Função de busca de uma lista de registros

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
Static Function GetLista(oSelf)

Local aConteudo as array
Local nX        as numeric

aConteudo := {"conteudo1","conteudo2","conteudo3"}//MinhaBuscaTudo()

oSelf:SetResponse('{"Lista": [')

For nX := 1 To Len(aConteudo)
    oSelf:SetResponse('"' + aConteudo[nX] + If(nX < Len(aConteudo), '",', '"'))
Next nX

oSelf:SetResponse(']}')

Return .T.
