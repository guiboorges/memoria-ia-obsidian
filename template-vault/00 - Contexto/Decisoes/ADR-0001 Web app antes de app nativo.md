---
tags: [decisao, adr]
ultima_atualizacao: 2026-10-08
status: aceita
---
# ADR-0001 — Web app antes de app nativo

## Contexto
O piloto tem 3 estúdios e cerca de 300 alunos. Publicar nas lojas da Apple e do Google leva semanas de revisão, e os alunos chegam ao Lumen por um link no WhatsApp do estúdio.

## Decisão
Lançar o Lumen como **web app responsivo** (funciona no celular pelo navegador, com atalho na tela inicial). O app nativo fica para depois do piloto.

## Consequências
- ✅ Lançamento em semanas, não meses; uma só base de código.
- ✅ O link do WhatsApp abre direto na reserva.
- ⚠️ Sem notificações push no iPhone antigo; usamos e-mail e WhatsApp para lembretes.

## Rever quando
Mais de 1.000 alunos ativos, ou se os estúdios pedirem notificações push.
