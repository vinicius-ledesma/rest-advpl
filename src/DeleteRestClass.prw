#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} DeleteRestClass
Exemplo de DELETE

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL DeleteRestClass DESCRIPTION "Exemplo de DELETE" FORMAT "application/json"

WSMETHOD DELETE DESCRIPTION "Delete simples sem nenhuma configuração." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} DELETE
DELETE simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD DELETE WSSERVICE DeleteRestClass

Local lRet      as logical

// Pego o ID do path param

If Len(::aURLParms) > 0
    // Aqui eu faço a VALIDAÇÃO e deleção da informação no sistema
    // Depois confirmo o resultado
    If .T.//MeuDelete(::aURLParms[1])
        lRet := .T.
        //HTTPSetStatus(204) //No content
        HTTPSetStatus(202,"Criada agendamento de deleção do resgitro " + ::aURLParms[1] +". Código de consulta: 123.")
    Else
        SetRESTFault(2,"O registro não pode ser deletado.",.T.,403)
        lRet := .F.
    EndIf
Else
    SetRESTFault(1,"Nenhum ID informado para deleção.",.T.,400)
    lRet := .F.
EndIf

Return lRet
