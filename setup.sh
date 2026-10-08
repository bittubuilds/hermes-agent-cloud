#!/usr/bin/env bash
set -e
echo "=== Hermes Agent Installer ==="
curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash --login
export PATH="$HOME/.local/bin:$PATH"
echo ""
echo "=== Hermes installed! ==="
echo "Next steps:"
echo "  1) hermes setup     <- model + API key wizard (pick Nous Portal / free model)"
echo "  2) hermes whatsapp  <- QR code scan from your phone WhatsApp"
