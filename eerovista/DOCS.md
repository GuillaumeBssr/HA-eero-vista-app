# eeroVista Home Assistant App

## Installation

1. Add this GitHub repository to **Settings → Apps → App store → ⋮ → Repositories**.
2. Refresh the App store.
3. Open **eeroVista** and choose **Install**.
4. Keep the default configuration for the first test.
5. Start the App.
6. Open the **Logs** tab and confirm the web server starts successfully.
7. Choose **Open Web UI**.
8. Complete eeroVista's Eero authentication wizard.

## Recommended initial configuration

For a Raspberry Pi 4 with 8 GB RAM:

- Device polling: 30 seconds
- Network polling: 60 seconds
- Web workers: 2
- Raw retention: 7 days
- Hourly retention: 30 days
- Daily retention: 365 days
- MQTT: disabled initially

## MQTT

MQTT support is included but disabled by default.

For a Home Assistant OS installation using the official Mosquitto Broker App, the hostname is normally:

`core-mosquitto`

Enable MQTT only after eeroVista itself is working and its topology data has been verified.

## Storage

The eeroVista SQLite database is stored persistently as:

`/data/eerovista.db`

The token-encryption key is generated on first start and stored persistently as:

`/data/.eerovista_encryption_key`

## Home Assistant sidebar shortcut

The reliable way to add eeroVista to the Home Assistant sidebar is a Webpage
dashboard:

1. Open **Settings → Dashboards**.
2. Select **Add dashboard**.
3. Choose **Webpage**.
4. Use title `eeroVista` and icon `mdi:wifi`.
5. Set the URL to `http://192.168.4.12:8780` (or replace the address/port with
   the effective address shown by your installation).
6. Enable **Show in sidebar**.
7. Leave **Admin only** disabled if the shortcut should be available to all
   Home Assistant users.

## Web port and native App Ingress

eeroVista listens on port 8080 inside its isolated container. The default host
mapping is port 8780 to reduce the likelihood of a collision. You can change
the host-side port from the App's **Network** settings before starting it.

Ingress is intentionally not enabled in this release. The upstream templates
and JavaScript use root-relative paths, which do not reliably work below Home
Assistant's per-App Ingress URL prefix.

## DNS

Upstream eeroVista includes optional DNS functionality. This Home Assistant wrapper deliberately does not expose or start that DNS service because it is unnecessary for mesh monitoring.

## Updating upstream eeroVista

This wrapper uses the official multi-architecture upstream image pinned to
`ghcr.io/yeraze/eerovista:v2.9.7`.

## Authentication limitation

eeroVista uses an unofficial Eero API. Amazon-linked Eero login accounts may require a separate standard Eero account invited as an administrator to the network.
