#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MinRestClass
Classe WSRESTFul inicial com o mínimo necessário

@author Vinicius Ledesma
@since 18/05/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL MinRestClass DESCRIPTION "API REST com o mínimo necessário."

WSMETHOD GET DESCRIPTION "Get simples sem nenhuma configuração."

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 18/05/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSSERVICE MinRestClass
    ::SetResponse('{"MinRestClass":"Success"}')
Return .T.
