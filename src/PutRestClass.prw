#INCLUDE 'totvs.ch'
#INCLUDE "restful.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} PutRestClass
Exemplo de PUT

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------

WSRESTFUL PutRestClass DESCRIPTION "Exemplo de PUT" FORMAT "application/json"

WSMETHOD PUT DESCRIPTION "Put simples sem nenhuma configuração." PRODUCES APPLICATION_JSON

END WSRESTFUL

//-------------------------------------------------------------------
/*/{Protheus.doc} PUT
PUT simples sem nenhuma configuração.

@author Vinicius Ledesma
@since 01/06/2020
/*/
//-------------------------------------------------------------------
WSMETHOD PUT WSSERVICE PutRestClass

Local lRet      as logical
Local cBody     as character

// Pego o ID do path param
If Len(::aURLParms) > 0

    If .T.//MinhaBusca(::aURLParms[1]) //É um id válido
        // Pego o Body da requisição
        cBody := ::GetContent()
        If !Empty(cBody)

            // Aqui eu faço a VALIDAÇÃO e alteração da informação no sistema
            // Depois confirmo o resultado
            If .T.//MinhaAlteração(::aURLParms[1])
                lRet := .T.
                HTTPSetStatus(204) //No content
            Else
                SetRESTFault(4,"O registro não pode ser alterado.",.T.,403)
                lRet := .F.
            EndIf

        Else
            SetRESTFault(3,"Conteúdo a ser alterado não foi enviado.",.T.,400)
            lRet := .F.
        EndIf
    Else
        SetRESTFault(2,"O ID não é válido.",.T.,404)
        lRet := .F.
    EndIf

Else
    SetRESTFault(1,"Nenhum ID informado para alteração.",.T.,400)
    lRet := .F.
EndIf

Return lRet
