#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} ProdRestClass
Classe WSRESTFul com Produces no método

@author Vinicius Ledesma
@since 22/05/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL ProdRestClass DESCRIPTION "API REST com Produces no método."

WSMETHOD GET DESCRIPTION "Get simples sem nenhuma configuração." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 22/05/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSSERVICE ProdRestClass
    ::SetResponse('{"ProdRestClass":"Success"}')
Return .T.
