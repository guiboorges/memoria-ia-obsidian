---
tags: [context, master]
last_updated: 2026-10-13
status: written
---
# MASTER-CONTEXT — Lumen

> The most important note in the vault. If Claude could read only one note, it would be this one. Keep it short (1–2 screens) and up to date.

## Who
- **Project owner:** Ana (product and design).
- **Team:** Ana + 1 freelance developer. Claude helps with research, writing, code and organization.

## What it is
Lumen is a booking app for small yoga and pilates studios. Students see the schedule, book a session and pay in one tap; the studio manages classes, the waitlist and session packs in a simple dashboard.

## Who it's for
- **Small studios** (1–3 rooms) that use WhatsApp and a spreadsheet today.
- **Students** who want to book without exchanging messages.

## Goal for the next 3 months
Launch a pilot with **3 studios** and reach **200 bookings per week** without manual support.

## Decisions already made (don't reopen without a reason)
- Responsive web app first, native app later → [[ADR-0001 Web app before native app]]
- Payments with Stripe → [[ADR-0002 Stripe for payments]]

## Principles
1. Booking a session must take less than 10 seconds.
2. The studio should never need training to use the dashboard.
3. No features the pilot didn't ask for.

## Out of scope (for now)
- Studio marketplace, reviews, chat.

## Where things are
- Code: the `lumen-app` repository (outside this vault).
- Design: the "Lumen v1" Figma file.
- Day-to-day state: [[STATUS]].
