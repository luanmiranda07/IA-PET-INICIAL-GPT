```json
{
  "name": "peticao_beneficio_incapacidade",
  "strict": true,
  "schema": {
    "type": "object",
    "properties": {
      "INICIO_VARA": {
        "type": "string",
        "description": "Endereçamento inicial da petição, de acordo com as regras da vara competente e domicílio da Parte Autora. Deve ser uma das duas strings fornecidas, de acordo com as instruções."
      },
      "NOME_CLIENTE": {
        "type": "string",
        "description": "Nome completo da Parte Autora, em maiúsculas, conforme constar nos documentos ou 'NAO_INFORMADO'."
      },
      "NUMERO_RG": {
        "type": "string",
        "description": "Número do RG da Parte Autora exatamente como constar nos documentos ou 'NAO_INFORMADO'."
      },
      "NUMERO_CPF": {
        "type": "string",
        "description": "Número do CPF da Parte Autora exatamente como constar nos documentos ou 'NAO_INFORMADO'."
      },
      "NOME_DA_RUA": {
        "type": "string",
        "description": "Logradouro do endereço da Parte Autora (apenas nome da rua, sem número ou CEP), ou 'NAO_INFORMADO'."
      },
      "NUMERO_CASA": {
        "type": "string",
        "description": "Número do imóvel no endereço da Parte Autora, ou 'NAO_INFORMADO'."
      },
      "CIDADE": {
        "type": "string",
        "description": "Município de residência da Parte Autora, em maiúsculas, ou 'NAO_INFORMADO'."
      },
      "UF": {
        "type": "string",
        "description": "UF do endereço da Parte Autora (duas letras maiúsculas), ou 'NAO_INFORMADO'.",
        "minLength": 2,
        "maxLength": 2
      },
      "CEP_CLIENTE": {
        "type": "string",
        "description": "CEP do endereço da Parte Autora, conforme constar, ou 'NAO_INFORMADO'."
      },
      "TIPO_ACAO": {
        "type": "string",
        "const": "AÇÃO PREVIDENCIÁRIA",
        "description": "Tipo da ação, preencha sempre com a string fornecida."
      },
      "VINCULO_COM_TRABALHO": {
        "type": "string",
        "description": "Se existe algum tipo de vinculo com trabalho, conforme opções estabelecidas.",
        "enum": [
          "SIM",
          "NAO"
        ]
      },
      "DATA_FATOS": {
        "type": "string",
        "description": "Data do acidente ou evento traumático principal no formato DD/MM/AAAA ou 'NAO_INFORMADO'."
      },
      "DOS_FATOS": {
        "type": "string",
        "description": "Relato cronológico e formal dos fatos, dinâmica do acidente, função, local de trabalho, atendimento, quadros evolutivos e tratamentos, conforme modelo."
      },
      "DOS_FATOS_LESAO": {
        "type": "string",
        "description": "Descrição objetiva da lesão, informar CID, devendo DESCREVER FRATURA/AMPUTAÇÃO e, se for o caso, MENCIONAR FIXAÇÃO DE HASTE E PINOS, com base no laudo e demais documentos, ou 'NAO_INFORMADO'."
      },
      "CAT_SE_ESTIVER": {
        "type": "string",
        "description": "Se houver CAT, parágrafo conforme instruções; se não houver, string vazia ('')."
      },
      "BENEFICIO": {
        "type": "string",
        "description": "Espécie do benefício, conforme opções estabelecidas ou 'NAO_INFORMADO'.",
        "enum": [
          "Auxílio-doença previdenciário",
          "Auxílio-doença por acidente de trabalho",
          "Auxilio por incapacidade temporária previdenciário",
          "Auxilio por incapacidade temporária por acidente de trabalho",
          "NAO_INFORMADO"
        ]
      },
      "NUMERO_BENEFICIO": {
        "type": "string",
        "description": "Número do benefício (NB) conforme constar na documentação ou 'NAO_INFORMADO'."
      },
      "DATA_CESSACAO": {
        "type": "string",
        "description": "Data de cessação, cancelamento, indeferimento ou alta do benefício (DD/MM/AAAA), ou 'BENEFICIO_ATIVO', ou 'NAO_INFORMADO'."
      },
      "DESCREVER_LIMITACAO": {
        "type": "string",
        "description": "Descrição técnica e formal das limitações físicas/funcionais causadas pela lesão/acidente, conforme documentação e orientações."
      },
      "DESCREVER_SEQUELAS": {
        "type": "string",
        "description": "Descrição das sequelas objetivas, tais como dores, rigidez, limitações em atividades, conforme documentação."
      },
      "LIMITACAO_INCAPACIDADE": {
        "type": "string",
        "description": "Parágrafo detalhando as atividades de trabalho prejudicadas pelas sequelas e limitações, com base na função habitual e/ou atual."
      },
      "OAB": {
        "type": "string",
        "description": "Inscrição na OAB correspondente ao UF do endereço da Parte Autora, obtida automaticamente a partir da tabela do arquivo 'AOBS.md' (uma OAB por UF). Se o UF for 'NAO_INFORMADO' ou não existir na tabela, preencher 'NAO_INFORMADO'.",
        "enum": [
          "OAB/SP nº 403.110",
          "OAB/AC nº 6205",
          "OAB/AL nº 19.554A",
          "OAB/AM nº A1814",
          "OAB/AP nº 5352-A",
          "OAB/BA nº 72947",
          "OAB/CE nº 47894-A",
          "OAB/DF nº 71599",
          "OAB/ES nº 37035",
          "OAB/GO nº 65009-A",
          "OAB/MA nº 25106-A",
          "OAB/MG nº 217298",
          "OAB/MS nº 27556ª",
          "OAB/MT nº 32134-A",
          "OAB/PA nº 34787-A",
          "OAB/PB nº 30904-A",
          "OAB/PE nº 58145",
          "OAB/PI nº 21463",
          "OAB/PR nº 109831",
          "OAB/RJ nº 233392",
          "OAB/RN nº 20.111-A",
          "OAB/RO nº 12423",
          "OAB/RR nº 694-A",
          "OAB/RS nº 127170A",
          "OAB/SC nº 65177",
          "OAB/SE nº 1485A",
          "OAB/TO nº 11.641-A",
          "NAO_INFORMADO"
        ]
      }
    },
    "required": [
      "INICIO_VARA",
      "NOME_CLIENTE",
      "NUMERO_RG",
      "NUMERO_CPF",
      "NOME_DA_RUA",
      "NUMERO_CASA",
      "CIDADE",
      "UF",
      "CEP_CLIENTE",
      "TIPO_ACAO",
      "VINCULO_COM_TRABALHO",
      "DATA_FATOS",
      "DOS_FATOS",
      "DOS_FATOS_LESAO",
      "CAT_SE_ESTIVER",
      "BENEFICIO",
      "NUMERO_BENEFICIO",
      "DATA_CESSACAO",
      "DESCREVER_LIMITACAO",
      "DESCREVER_SEQUELAS",
      "LIMITACAO_INCAPACIDADE",
      "OAB"
    ],
    "additionalProperties": false
  }
}
```