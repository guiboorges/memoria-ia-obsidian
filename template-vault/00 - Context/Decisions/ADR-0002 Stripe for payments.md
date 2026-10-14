---
tags: [decision, adr]
last_updated: 2026-10-11
status: accepted
---
# ADR-0002 — Stripe for payments

## Context
Students pay for drop-in sessions and 10-session packs. The studios want to be paid directly into their own accounts, without Lumen ever touching the money.

## Decision
Use **Stripe Checkout** with **Stripe Connect**: each studio has its own connected account and gets paid directly.

## Alternatives considered
- Paying at the studio (in cash): doesn't solve the no-show problem.
- PayPal: higher fees and a worse checkout on mobile.

## Consequences
- ✅ No card data stored; Stripe handles security.
- ⚠️ Each studio has to create its Stripe account during onboarding (about 10 minutes).
