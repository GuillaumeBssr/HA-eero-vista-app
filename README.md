# Home Assistant eeroVista App Repository

A Home Assistant OS App wrapper for [eeroVista](https://github.com/Yeraze/eeroVista), a read-only monitoring tool for Eero mesh networks.

This repository is intentionally a **Home Assistant App repository**, not a HACS integration. eeroVista runs as a separate service with its own database and web UI.

## Initial target

- Home Assistant OS
- Raspberry Pi 4 / `aarch64`
- Home Assistant Ingress and all-user sidebar panel
- Optional direct web UI on host port 8780 (container port 8080)
- Persistent database in the App `/data` directory
- No DNS port exposure
- MQTT integration disabled by default

## Installation

Add this repository URL to Home Assistant:

`https://github.com/GuillaumeBssr/HA-eero-vista-app`

Then open:

**Settings → Apps → App store → ⋮ → Repositories**

## Upstream

This wrapper is not affiliated with Eero or the eeroVista project. eeroVista uses an unofficial reverse-engineered Eero API.

## Home Assistant Ingress and sidebar

Version 0.3.1 adds an internal compatibility proxy for Home Assistant Ingress.
Home Assistant therefore owns the public URL and the sidebar shortcut works
through the LAN, Tailscale, or any other valid Home Assistant address.

After updating, enable **Show in sidebar** on the eeroVista App information
page. The panel is available to non-admin users (`panel_admin: false`).
