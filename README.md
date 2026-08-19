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


This wrapper is not affiliated with Eero or the eeroVista project. eeroVista uses an unofficial reverse-engineered Eero API.

## Why this does not use Home Assistant Ingress yet

Ingress avoids host ports, but the current upstream UI uses root-relative URLs
such as `/static/...`, `/api/...`, `/devices`, and `/network`. Those URLs are
not safe behind Home Assistant's path-prefixed Ingress proxy without patching
the application. This experimental release therefore uses host port 8780 by
default. The port can be changed in the App's **Network** settings if needed.
