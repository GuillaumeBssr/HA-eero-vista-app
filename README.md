# Home Assistant eeroVista App Repository

A Home Assistant OS App wrapper for [eeroVista](https://github.com/Yeraze/eeroVista), a read-only monitoring tool for Eero mesh networks.

This repository is intentionally a **Home Assistant App repository**, not a HACS integration. eeroVista runs as a separate service with its own database and web UI.

## Initial target

- Home Assistant OS
- Raspberry Pi 4 / `aarch64`
- eeroVista web UI on host port 8780 (container port 8080)
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

## Why this does not use Home Assistant Ingress yet

Ingress avoids host ports, but the current upstream UI uses root-relative URLs
such as `/static/...`, `/api/...`, `/devices`, and `/network`. Those URLs are
not safe behind Home Assistant's path-prefixed Ingress proxy without patching
the application. This experimental release therefore uses host port 8780 by
default. The port can be changed in the App's **Network** settings if needed.

## Add eeroVista to the Home Assistant sidebar

Until upstream supports path-prefixed Ingress, create a **Webpage dashboard**
under **Settings → Dashboards** with URL `http://192.168.4.12:8780`, enable
**Show in sidebar**, and leave **Admin only** disabled for access by all users.
See the App documentation for the complete steps.
