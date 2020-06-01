#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} ServerIPRestClass
Classe WSRESTFul para disponibilizar o IP do servidor

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL ServerIPRestClass DESCRIPTION "Classe WSRESTFul para disponibilizar o IP do servidor." FORMAT "application/json"

WSMETHOD GET DESCRIPTION "Get simples sem nenhuma configuração." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} GET
Get simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD GET WSSERVICE ServerIPRestClass

::SetResponse('{"IP do servidor":"'+GetServerIp()+'"}')

Return .T.
