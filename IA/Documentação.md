Tudo precisa ter resposta formal e com linguajar jurídico quando necessário.
# Objetivo

Criar uma petição inicial, preciso que vc, informe dados precisos e tb gere as respostas de cada chave que criamos para vincular com o modelo word e preencher com suas respostas.

No documento word em anexo, pode ver que contem chaves, essas chaves vão conter as respostas/dados que vc passar. Sua base de dados vai ser os documentos necessários que vamos passar para analise e leitura onde será usado para criar a petição inicial.

De modelos word temos:
- Modelo com chaves
- modelo padrão sem chaves

Nas etapas abaixo, é informado as chaves usadas no documento.
Porem vamos configurar o agente para retornar apenas seguindo um Json-schema que vai conter todas essas chaves, além de alguns padrões de resposta/opções.

---
# Documentos necessários
Documentos necessários para base de dados que vai ser utilizada nas respostas
- Roteiro.pdf (vai ser o principal documento para obter os dados)
- Procuração.pdf
- Declaração de Benefício.pdf
- Laudo.pdf
- CAT.pdf

---
# Etapas para criar a Inicial

## VARA
Vai ser definida com base no estado/região do autor.
key: {INICIO_VARA}
Entre as opções:
("**EXCELENTÍSSIMO(A) SENHOR(A) DOUTOR(A) JUIZ(A) DE DIREITO DA ª VARA DA FAZENDA PÚBLICA DE ACIDENTES DO TRABALHO DO FORO CENTRAL DE SÃO PAULO/SP**"
********
"**EXCELENTÍSSIMO(A) SENHOR(A) DOUTOR(A) JUIZ(A) DE DIREITO DA ª VARA CIVEL DO FORO NÚCLEO 4.0 ACIDENTE DE TRABALHO DO INTERIOR E LITORAL/SP**")
## Qualificação
- Roteiro.pdf
- Procuração.pdf
- Declaração de Benefício.pdf

### dados Cliente
{NOME_CLIENTE}
{NUMERO_RG}
{NUMERO_CPF}
{NOME_DA_RUA}
{NUMERO_CASA}
{CIDADE}
{UF}
{CEP_CLIENTE}
{TIPO_ACAO}: (AÇÃO PREVIDENCIÁRIA PARA CONCESSÃO DE AUXILÍO ACIDENTE OU RESTABELECIMENTO DE AUXÍLIO POR INCAPACIDADE TEMPORÁRIA/AUXÍLIO-DOENÇA POR ACIDENTE DE TRABALHO)
## Preliminares
- **C) Da Competência**
KEY: {VINCULO__COM_TRABALHO}
- Roteiro.pdf
	Vai ser definido a competência caso tenha vinculo com o trabalho.
	- **Federal:** Sem vinculo com trabalho (Não tem competência)
	- **Estadual:** Tem vinculo com o trabalho (Tem competência)
	

## Dos Fatos
OBS: Responder com um tom formal, não trazer pontos irrelevantes na resposta.

- **Arquivo** padrão vai ser o "**roteiro.pdf**":
Procurar o tópico "Descreva os detalhes do acidente" para montar os fatos.
Dos Fatos: definir um prompt para a ia se basear na descrição do "roteiro de visita" e responder com um tom formal , não trazer pontos irrelevantes na respostas

Caso tenha o documento "**CAT.pdf**": Pegar a descrição do mesmo.

DESCREVER MINIMAMENTE A LESÃO: FRATURA/AMPUTAÇÃO, SE O CASO, MENCIONAR FIXAÇÃO DE HASTE E PINOS. Obter essas informações do LAUDO (caso não tenha laudo, tente pelo roteiro).

KEYS:
{DATA_FATOS}: Informar a data do acidente ocorrido.
{DOS_FATOS}: DESCREVER FRATURA/AMPUTAÇÃO, SE O CASO, MENCIONAR FIXAÇÃO DE HASTE E PINOS
{CAT_SE_ESTIVER}: ADAPTAR AO CASO, SE NÃO HOUVER CAT, RETIRAR DO TEXTO
### Dados do benefico:

KEYS:
{BENEFICIO}: Opções: (Auxílio-doença previdenciário/Auxílio-doença por acidente de trabalho/Auxilio por incapacidade temporária previdenciário/Auxilio por incapacidade temporária por acidente de trabalho}
{NUMERO_BENEFICIO}: numero do beneficio
{DATA_CESSACAO}: data da cessação do beneficio
Buscar essas informações do arquivo "**Declaração de Benefício.pdf**"

## DOS FUNDAMENTOS JURÍDICOS
- E) 5. DAS EXIGÊNCIAS DO ART. 129-A, INCISO I, LEI N° 8.213 
1. DA DESCRIÇÃO DA DOENÇA E DAS LIMITAÇÕES DECORRENTES

KEYS:
{DESCREVER_LIMITACAO}: DESCREVER FRATURA/AMPUTAÇÃO, SE O CASO, MENCIONAR FIXAÇÃO DE HASTE E PINOS
{DESCREVER_SEQUELAS}: DESCREVER COM BASE NAS SEQUELAS INFORMADAS NO ROTEIRO DE VISITAS QUAIS AS LIMITAÇÕES DO AUTOR

"Conforme exposto na narração fática, a Parte Autora foi diagnosticada com  e restou com {DESCREVER_LIMITACAO} e restou com {DESCREVER_SEQUELAS}"

2. DAS ATIVIDADES PARA AS QUAIS O AUTOR TEM INCAPACIDADE
OBS: caso o acidente/lesão tenha ocorrido antigamente: fazer uma correlação entre a lesão da época com o atual emprego, para informar:

KEY:
{LIMITACAO_INCAPACIDADE}: SE O CASO, DISCORRER EM UM PARÁGRAFO COMO AS LIMITAÇÕES REFERIDAS NO TÓPICO ANTERIOR PREJUDICAM NO TRABALHO, EM QUAIS ATIVIDADES HÁ PREJUÍZO

## OAB
Definir OAB com base no Estado atual de residência do autor.
KEY:
{OAB}