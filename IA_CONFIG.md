# Configuração da IA (OpenAI Assistants API)

Este documento descreve como configurar o Assistente na plataforma da OpenAI para que ele funcione corretamente com este projeto.

## 1. Criar o Assistente

1. Acesse o [OpenAI Platform](https://platform.openai.com/assistants).
2. Clique em **+ Create**.
3. Defina um nome para o assistente (ex: "Assistente Petição Inicial").
4. Selecione o modelo (recomendado: `gpt-5-mini` ou superior).

## 2. Instruções do Sistema (Prompt)

O prompt define a personalidade, objetivos e regras de negócio da IA.

Copie o conteúdo do arquivo abaixo e cole no campo **Instructions** do assistente:

📄 **Arquivo:** [IA/PROMPT.md](IA/PROMPT.md)

## 3. Estrutura de Resposta (JSON Schema)

Para garantir que a IA retorne sempre o JSON correto, ative a opção **Structured Outputs** (ou Response Format: JSON Object) e use o schema definido no arquivo abaixo:

📄 **Arquivo:** [IA/JSON-SCHEMA.json](IA/JSON-SCHEMA.json)

## 4. Base de Conhecimento (Vector Store)

Para que a IA tenha acesso a informações contextuais e modelos, você deve fazer upload dos seguintes arquivos na seção **File Search** (ou Vector Store) do assistente:

Os arquivos estão localizados na pasta `docs/` do projeto:

1. **OABS.md**: Tabela de mapeamento de OAB por estado.
2. **Pet Inicial modelo para IA.docx**: O modelo base do documento Word.
3. **padrao 01. Pet. Inicial - CC - Trab - Def 4.docx**: Documento de referência adicional.

Certifique-se de ativar a ferramenta **File Search** no assistente.
