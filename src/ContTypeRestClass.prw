#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} ContTypeRestClass
Classe WSRESTFul com SetContentType no método

@author Vinicius Ledesma
@since 22/05/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL ContTypeRestClass DESCRIPTION "API REST com o mínimo necessário."

WSMETHOD GET DESCRIPTION "Get simples sem nenhuma configuração."

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 22/05/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSSERVICE ContTypeRestClass
    ::SetContentType('application/json')
    ::SetResponse('{"ContTypeRestClass":"Success"}')
Return .T.
