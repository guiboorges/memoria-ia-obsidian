---
tags: [contexto, master]
ultima_atualizacao: 2026-10-13
status: escrito
---
# MASTER-CONTEXT — Lumen

> A nota mais importante do vault. Se o Claude só pudesse ler uma nota, seria esta. Mantenha curta (1–2 telas) e atualizada.

## Quem
- **Dono do projeto:** Ana (produto e design).
- **Equipe:** Ana + 1 dev freelancer. O Claude ajuda em pesquisa, escrita, código e organização.

## O que é
Lumen é um app de reservas para pequenos estúdios de yoga e pilates. O aluno vê os horários, reserva uma aula e paga num toque; o estúdio gerencia turmas, lista de espera e pacotes de aulas num painel simples.

## Para quem
- **Estúdios pequenos** (1–3 salas) que hoje usam WhatsApp e planilha.
- **Alunos** que querem reservar sem trocar mensagens.

## Objetivo dos próximos 3 meses
Lançar um piloto com **3 estúdios** e chegar a **200 reservas por semana** sem suporte manual.

## Decisões já tomadas (não reabrir sem motivo)
- Web app responsivo primeiro, app nativo depois → [[ADR-0001 Web app antes de app nativo]]
- Pagamentos com Stripe → [[ADR-0002 Stripe para pagamentos]]

## Princípios
1. Reservar uma aula tem de levar menos de 10 segundos.
2. O estúdio nunca deve precisar de treino para usar o painel.
3. Nada de funcionalidade que o piloto não pediu.

## Fora do escopo (por agora)
- Marketplace de estúdios, avaliações, chat.

## Onde estão as coisas
- Código: repositório `lumen-app` (fora deste vault).
- Design: arquivo Figma "Lumen v1".
- Estado do dia a dia: [[STATUS]].
