# Instruções para o Claude — vault do projeto Lumen

Este vault é a **memória de longo prazo** do projeto. Você não lembra das sessões anteriores; este vault lembra por você. Trate-o como a fonte da verdade.

## Ao começar uma sessão

1. Leia, nesta ordem:
   - `00 - Contexto/MASTER-CONTEXT.md` — o que é o projeto e o que já foi decidido
   - `00 - Contexto/STATUS.md` — onde estamos e o que falta
   - `99 - Memoria Claude/MEMORY.md` — lições e preferências das sessões anteriores
2. Se o `STATUS.md` tiver **lembretes com data** que já venceram, avise logo no início.
3. Responda em uma frase onde o projeto está e qual é o próximo passo, antes de começar o trabalho.

Para assuntos específicos, comece pelo `README.md` da pasta (é o índice dela) e só depois abra as notas.

## Durante a sessão

- **Decisões não se reabrem sem motivo.** Se algo já está em `00 - Contexto/Decisoes/`, siga a decisão. Se houver um motivo novo para mudar, diga qual é e proponha um ADR que substitua o anterior.
- **Decisão nova = ADR novo.** Crie `00 - Contexto/Decisoes/ADR-NNNN Título.md` a partir de `Templates/Template ADR.md` e acrescente uma linha no índice `00 - Contexto/Decisoes.md`.
- **Dúvida que depende de outra pessoa** vai para `00 - Contexto/Questoes em Aberto.md`, não fica perdida na conversa.
- **Termo novo do projeto** vai para `00 - Contexto/Glossario.md`.
- Escreva notas curtas e diretas. Uma ideia por nota. Use links `[[Nome da nota]]` entre notas relacionadas.

## Ao terminar (ou quando o hook pedir)

1. Atualize `00 - Contexto/STATUS.md`: o que foi feito, o que mudou no "falta fazer", lembretes novos.
2. Acrescente um bullet datado em `99 - Memoria Claude/MEMORY.md` se aprendeu algo que vale para as próximas sessões (uma preferência, um erro a evitar, um atalho).
3. Se mexeu em notas de uma pasta, atualize o `README.md` dessa pasta (seção "Trabalho feito" ou "Em aberto").
4. Atualize o campo `ultima_atualizacao` no topo de cada nota que alterou.

## Comandos rápidos

- **`status`** — leia o STATUS e responda em 5 linhas: fase atual, o que foi feito por último, os próximos 3 passos e os lembretes com data.
- **`revisão da semana`** — leia o STATUS, o MEMORY e as notas alteradas nos últimos 7 dias; diga o que avançou, o que travou e a prioridade da próxima semana; atualize o STATUS e o MEMORY.
- **`fechar`** — faça os passos de "Ao terminar" agora.

## Formato das notas

Toda nota começa com este cabeçalho (frontmatter):

```yaml
---
tags: [contexto]
ultima_atualizacao: AAAA-MM-DD
status: rascunho | escrito | obsoleto
---
```

## O que nunca fazer

- Apagar notas. Se algo ficou obsoleto, mude `status: obsoleto` e explique o motivo no topo.
- Inventar fatos sobre o projeto. Se não está no vault, pergunte.
- Guardar senhas, tokens ou dados pessoais de clientes no vault.
