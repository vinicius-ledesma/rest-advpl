#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} ParamRestClass
Classe WSRESTFul com passagem de parâmetros

@author Vinicius Ledesma
@since 26/02/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL ParamRestClass DESCRIPTION "Classe WSRESTFul com passagem de parâmetros." FORMAT "application/json"

WSMETHOD GET DESCRIPTION "Get simples sem nenhuma configuração." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 26/02/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSSERVICE ParamRestClass

Local aAux  as array
Local cAux  as character
Local nX    as numeric
Local nLen  as numeric

::SetResponse('{"ParamRestClass":"Success"')

// Path Param
If (nLen := Len(::aURLParms)) > 0
    ::SetResponse(',"Path Param":[')
    For nX := 1 To nLen
        ::SetResponse('"' + ::aURLParms[nX] + If(nX < nLen, '",', '"'))
    Next nX
    ::SetResponse(']')
EndIf

// Header Param pegando todos os valores passados
aAux := HTTPGetHeader()
If (nLen := Len(aAux)) > 0
    ::SetResponse(',"Header Param":[')
    For nX := 1 To nLen
        ::SetResponse("{" + '"' + aAux[nX,1] + '":"' + aAux[nX,2] + If(nX < nLen, '"},', '"}'))
    Next nX
    ::SetResponse(']')
EndIf

// Header Param específico
cAux := HTTPHeader("myhead")
If !Empty(cAux)
    ::SetResponse(',"Header Param myhead":"' + cAux + '"')
Else
    ::SetResponse(',"Header Param myhead":"Cabeçalho não enviado"')
EndIf

// Query String
If (nLen := Len(::aQueryString)) > 0
    ::SetResponse(',"Query String":[')
    For nX := 1 To nLen
        ::SetResponse("{" + '"' + ::aQueryString[nX,1] + '":"' + ::aQueryString[nX,2] + If(nX < nLen, '"},', '"}'))
    Next nX
    ::SetResponse(']')
EndIf

// Body
cAux := ::GetContent()
If !Empty(cAux)
    ::SetResponse(',"Body":"' + cAux + '"')
Else
    ::SetResponse(',"Body":"Nenhum conteúdo enviado"')
EndIf

::SetResponse('}')

Return .T.
