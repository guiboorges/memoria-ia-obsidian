---
tags: [decisao, adr]
ultima_atualizacao: 2026-10-11
status: aceita
---
# ADR-0002 — Stripe para pagamentos

## Contexto
Os alunos pagam aulas avulsas e pacotes de 10 aulas. Os estúdios querem receber direto na conta deles, sem o Lumen tocar no dinheiro.

## Decisão
Usar **Stripe Checkout** com **Stripe Connect**: cada estúdio tem a sua conta conectada e recebe direto.

## Alternativas consideradas
- Pagamento no estúdio (em dinheiro): não resolve o problema das faltas.
- PayPal: taxas mais altas e checkout pior no celular.

## Consequências
- ✅ Sem guardar dados de cartão; o Stripe trata da segurança.
- ⚠️ Cada estúdio precisa criar a conta Stripe no onboarding (cerca de 10 minutos).
