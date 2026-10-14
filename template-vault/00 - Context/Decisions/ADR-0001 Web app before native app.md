---
tags: [decision, adr]
last_updated: 2026-10-08
status: accepted
---
# ADR-0001 — Web app before native app

## Context
The pilot has 3 studios and about 300 students. Publishing to the Apple and Google stores takes weeks of review, and students reach Lumen through a link in the studio's WhatsApp.

## Decision
Launch Lumen as a **responsive web app** (it works on the phone through the browser, with a home-screen shortcut). The native app waits until after the pilot.

## Consequences
- ✅ Launch in weeks, not months; a single codebase.
- ✅ The WhatsApp link opens straight into the booking.
- ⚠️ No push notifications on older iPhones; we use email and WhatsApp for reminders.

## Revisit when
More than 1,000 active students, or if the studios ask for push notifications.
