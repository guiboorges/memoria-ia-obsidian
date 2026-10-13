# Prompts do dia a dia

Copie e cole no Claude. No **Claude Code** aberto dentro do vault, o `CLAUDE.md` já faz o Claude ler a memória sozinho. No **Claude Desktop** ou no **claude.ai** (com o conector MCP), use o prompt "Começar sessão" para ele ler a memória primeiro.

---

## 1. Começar sessão
*(no Claude Desktop / claude.ai; no Claude Code não é preciso)*

```text
Vamos trabalhar no projeto [NOME]. Pelo conector do Obsidian, leia o CLAUDE.md do vault e siga as instruções:
leia o MASTER-CONTEXT, o STATUS e o MEMORY. Depois diga, numa frase, onde o projeto está, qual é o próximo
passo e se há algum lembrete com data vencido.
```

## 2. Preencher o MASTER-CONTEXT de um projeto novo

```text
Quero criar a memória do projeto [NOME]. Faça uma entrevista curta comigo, uma pergunta de cada vez, para preencher
o 00 - Contexto/MASTER-CONTEXT.md: quem, o que é, para quem, objetivo dos próximos 3 meses, decisões já tomadas,
princípios e o que está fora do escopo. No fim, escreva a nota (máximo 2 telas) e crie o STATUS.md com a fase atual
e os próximos 3 passos.
```

## 3. Registrar uma decisão

```text
Decidimos [DECISÃO] porque [MOTIVO]. Crie um ADR novo em 00 - Contexto/Decisoes/ a partir do Templates/Template ADR.md,
com contexto, alternativas e consequências, e acrescente a linha no índice Decisoes.md. Se esta decisão substitui
outra, marque a antiga como "substituída" e ligue as duas.
```

## 4. Status rápido

```text
status
```
*(o CLAUDE.md já explica o que fazer: ler o STATUS e responder onde estamos, o que falta e os lembretes.)*

## 5. Revisão da semana

```text
Revisão da semana: leia o STATUS, o MEMORY e as notas alteradas nos últimos 7 dias. Diga o que avançou, o que
travou e o que deve ser prioridade na próxima semana. Depois atualize o STATUS (seção "Falta fazer") e
acrescente no MEMORY as lições da semana.
```

## 6. Fechar a sessão
*(com os hooks ativos isto acontece sozinho; sem hooks, peça no fim)*

```text
Vamos fechar. Atualize o STATUS com o que fizemos hoje, acrescente no MEMORY o que vale lembrar da próxima vez
e atualize o README das pastas onde mexemos.
```

## 7. Trazer notas antigas para o vault

```text
Na pasta [PASTA] há notas soltas sobre este projeto. Leia essas notas e distribua o que importa pelas notas certas do vault
(decisões viram ADRs, termos vão para o Glossário, dúvidas para Questões em Aberto, o resto para a pasta de
assunto certa). Não apague nada; no fim, me mostre o que foi para onde.
```

## 8. Perguntar ao vault

```text
O que já decidimos sobre [ASSUNTO] e por quê? Responda só com o que está no vault, citando as notas.
```
