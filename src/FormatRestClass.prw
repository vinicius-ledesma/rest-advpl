#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} FormatRestClass
Classe WSRESTFul com Format na classe

@author Vinicius Ledesma
@since 22/05/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL FormatRestClass DESCRIPTION "API REST com Format na classe." FORMAT "application/json"

WSMETHOD GET DESCRIPTION "Get simples sem nenhuma configuração."

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 22/05/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSSERVICE FormatRestClass
    ::SetResponse('{"FormatRestClass":"Success"}')
Return .T.
