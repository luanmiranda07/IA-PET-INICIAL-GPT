# Assistente IA — Petição Inicial

Este documento descreve **todo o funcionamento do projeto**, sua arquitetura, dependências, lógica interna e o fluxo completo de uso — desde a leitura dos PDFs, análise pela IA, extração de JSON, até a geração automática de um **arquivo Word preenchido** com base em um modelo.

Também preserva e documenta o trecho original do repositório referente ao comando de criação do executável.

---

# 📌 Sumário

- [Visão Geral do Projeto](#visão-geral-do-projeto)
- [Como o Sistema Funciona](#como-o-sistema-funciona)
- [Arquitetura dos Arquivos](#arquitetura-dos-arquivos)
- [Explicação Completa do Código](#explicação-completa-do-código)
  - [main.py — Núcleo da IA e Geração de Word](#mainpy--núcleo-da-ia-e-gera%C3%A7%C3%A3o-de-word)
  - [gui.py — Interface Gráfica (PySide6)](#guipy--interface-gr%C3%A1fica-pyside6)
- [Configuração e Dependências](#configura%C3%A7%C3%A3o-e-depend%C3%AAncias)
- [Gerando Executável (.exe)](#gerando-execut%C3%A1vel-exe)
- [Como Usar o Sistema](#como-usar-o-sistema)
- [Contribuições](#contribui%C3%A7%C3%B5es)
- [Licença](#licen%C3%A7a)

---

# 📘 Visão Geral do Projeto

O **Assistente IA — Petição Inicial** é um software capaz de:

1. **Receber até 6 PDFs** enviados pelo usuário.
2. **Enviar esses PDFs para um agente de IA** previamente configurado.
3. **Receber do agente uma resposta estrutururada em JSON**, contendo campos usados em uma petição inicial padrão.
4. **Extrair esse JSON**, validar e preparar os dados.
5. **Preencher automaticamente um modelo Word (.docx)** com placeholders como `{NOME_CLIENTE}`, `{DATA}`, `{NARRATIVA}`, etc.
6. **Gerar automaticamente a petição final**, pronta para uso.

Ele também possui uma **interface gráfica moderna**, construída com **PySide6**, permitindo uso corporativo amigável e seguro.

---

# 🧠 Como o Sistema Funciona

Fluxo completo:

1. **Usuário seleciona ou arrasta PDFs** → *gui.py*
2. A GUI envia os arquivos para uma *thread* → *IAWorker*
3. A thread chama a função `analisar_pdfs()` → *main.py*
4. `main.py`:
   - carrega `.env`
   - se conecta ao agente da OpenAI
   - faz upload dos PDFs (agora com expiração automática)
   - envia a requisição
   - recebe a resposta
   - extrai o JSON
5. A interface recebe a resposta textual e exibe.
6. Usuário clica **Gerar Word** → a GUI reutiliza a resposta.
7. `preencher_modelo_word()` cria o DOCX final.

Tudo isso ocorre mantendo o sistema responsivo, com barra de progresso animada.

---

# 📁 Arquitetura dos Arquivos

```
📦 Projeto
├── IA/                    → Arquivos de configuração da IA (Prompt e Schema)
├── docs/                  → Documentos para base de conhecimento
├── gui.py                 → Interface gráfica (PySide6)
├── main.py                → Motor da IA + geração de Word
├── setup.ps1              → Script de instalação de dependências
├── build.ps1              → Script de geração do executável
├── Pet Inicial modelo...  → Modelo base .docx
├── IA_CONFIG.md           → Documentação de configuração da IA
├── .env.exemple           → Exemplo de configuração da API
├── README.md              → Este arquivo
├── pyproject.toml         → Dependências
```

---

# 🔍 Explicação Completa do Código

## main.py — Núcleo da IA e Geração de Word

### 1. Carregamento de Ambiente

```python
load_dotenv(dotenv_path=env_path)
```

Carrega a variável `OPENAI_API_KEY` necessária.

### 2. Conexão com a API

```python
_client = OpenAI(api_key=api_key)
```

Somente é criada quando necessário (lazy load).

### 3. Função principal: `analisar_pdfs()`

Responsável por:

- validar PDFs
- fazer upload para a OpenAI
- **definir um tempo de expiração (atualmente 1 HORA) para os arquivos enviados à OpenAI**, usando o parâmetro:

```python
expires_after={
    "anchor": "created_at",
    "seconds": 3600
}
```

- enviar ao agente salvo
- receber a resposta
- opcionalmente gerar o Word na mesma chamada

Essa expiração automática aumenta a segurança e reduz a retenção de dados sensíveis nos servidores da OpenAI.

### 4. `preencher_modelo_word()`

Abre o arquivo modelo, procura chaves `{CHAVE}` e substitui com o conteúdo vindo do JSON.

Inclui lógica especial para o campo `VINCULO_COM_TRABALHO`:

- Se houver "SIM" → texto jurídico automático é inserido
- Caso contrário → o campo é apagado

### 5. `_extrair_json_puro()`

Remove blocos ``json`` caso a IA retorne formatado.

---

## gui.py — Interface Gráfica (PySide6)

### Principais componentes:

### 1. **DropZone**

Área onde o usuário arrasta PDFs.

### 2. **MainWindow**

Contém:

- seleção de arquivos
- barra de progresso animada
- botão "Perguntar à IA"
- campo de saída da IA
- botão "Gerar Word"
- botão "Ajuda"

### 3. **IAWorker (QThread)**

Executa a chamada para a IA sem travar a GUI.

### 4. **Geração de Word na própria GUI**

A GUI:

- usa a mesma resposta já exibida
- importa funções do `main.py`
- realiza o preenchimento do DOCX

Esse design garante economia de requisições à IA.

### 5. **Ajuda**

O botão **Ajuda** exibe um guia rápido contendo:

- **Como usar:** Passo a passo resumido (Selecionar PDFs → Perguntar à IA → Gerar Word).
- **Arquivos Recomendados:** Lista dos documentos ideais para análise (Roteiro, Laudo, Declaração de Benefício, Docs. INSS, Procuração e CAT).
- **Avisos Importantes:**
  - Limite de **6 arquivos**.
  - Necessidade de PDFs legíveis.
  - Tempo médio de resposta da IA (~3 minutos).
  - Necessidade de conexão com a internet.
- **Suporte:** Informações de contato e versão do software.
---

# ⚙️ Configuração e Dependências

> **IMPORTANTE:** Para configurar corretamente o Assistente na OpenAI (Prompt, JSON Schema e Arquivos), consulte o documento: [IA_CONFIG.md](IA_CONFIG.md).

Arquivo: **pyproject.toml**

Principais dependências:

- PySide6
- python-docx
- openai
- python-dotenv

Crie um `.env` ao lado do executável contendo as variáveis de ambiente necessárias:

Podem ser encontradas no arquivo `.env.example`.

---

# 🏗️ Gerando Executável (.exe)

Para facilitar o processo, foram criados dois scripts de automação:

### 1. `setup.ps1` (Configuração Inicial)
Execute este script primeiro para preparar o ambiente. Ele irá:
- Instalar o `pipx`
- Instalar o `uv`
- Sincronizar as dependências do projeto

### 2. `build.ps1` (Gerar Executável)
Após configurar o ambiente, execute este script para criar o `.exe`. Ele roda automaticamente o comando:

```bash
uv run pyinstaller --onefile --windowed --add-data "Pet Inicial modelo para IA.docx;." --add-data ".env;." --icon "ICON_PET_INICIAL_IA.ico" --name "AssistenteDEMOINICIAL" --collect-all PySide6 gui.py
```

Esse comando:
- cria um executável único
- inclui o modelo Word e .env no pacote
- usa o ícone personalizado
- empacota automaticamente dependências do PySide6

---

# ▶️ Como Usar o Sistema

1. Abra o executável ou rode `python gui.py`.
2. Selecione ou arraste até **6 PDFs**.
3. Clique **Perguntar à IA**.
4. Aguarde a resposta no campo de texto.
5. Clique **Gerar Word**.
6. Escolha onde salvar o arquivo.

---

# 🤝 Contribuições

Pull requests são bem-vindos.

---

# 📄 Licença

Projeto privado — uso interno. Equipe Legal Ops
