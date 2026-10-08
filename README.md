# Hermes Agent — Cloud (Free) + WhatsApp

Hermes AI agent runs **in the cloud** (GitHub Codespaces) — **zero storage used on your phone**.
You talk to it directly from your normal WhatsApp.

## Setup (5 minutes, no card needed)

1. Green **<> Code** button → **Codespaces** tab → **Create codespace on main**
   (wait 3-5 min; Hermes auto-installs)
2. In the terminal run:
   ```
   hermes setup
   ```
   Choose **Nous Portal** (free model) when asked about the provider.
3. Then run:
   ```
   hermes whatsapp
   ```
   A **QR code** appears in the terminal → scan it from
   **WhatsApp → Settings → Linked Devices → Link a Device**
4. Done! Send any message to yourself on WhatsApp — Hermes replies.

## Important notes

- Free plan Codespace hours are limited (~60 hrs/month on 2-core). When the
  codespace stops, the WhatsApp link pauses. Restart it anytime from
  https://github.com/codespaces
- Codespace data (Hermes memory/skills) persists while the codespace exists.
- For true 24/7 free hosting later, use Oracle Cloud Always Free (needs a card
  for verification only) — this same repo works there via `bash setup.sh`.
