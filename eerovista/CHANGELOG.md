# Changelog

## 0.3.2

- Fix API requests when eeroVista is opened from the Home Assistant sidebar.
- Rewrite API paths stored in JavaScript variables, including the nodes,
  topology, IP-reservation and port-forward endpoints.
- Keep direct access on the configured host port as a fallback.

## 0.3.1

- Restore the locally built, version-pinned source image after the upstream
  GHCR base image failed during Supervisor's ARM64 BuildKit build.
- Keep eeroVista pinned to `v2.9.7`.
- Add Home Assistant Ingress on internal port 8099.
- Add an all-user `eeroVista` sidebar panel without a fixed LAN or Tailscale URL.
- Add an internal Nginx compatibility proxy that rewrites eeroVista's
  root-relative URLs to the current Home Assistant Ingress prefix.

## 0.3.0

- Upgrade eeroVista from `v2.7.1` to `v2.9.7`.
- Build on the official prebuilt multi-architecture eeroVista image instead of
  cloning and compiling the application on the Home Assistant host.
- Document an all-user Home Assistant sidebar shortcut using a Webpage
  dashboard while upstream remains incompatible with path-prefixed Ingress.

## 0.2.0

- Start both the eeroVista collector and web server; the earlier draft started
  only the UI process and therefore would not collect historical metrics.
- Pin upstream eeroVista to stable tag `v2.7.1`.
- Change the default host port from 8080 to 8780 while retaining container port
  8080; users can change or disable the mapping in the App Network settings.
- Add a Home Assistant watchdog using `/api/health`.
- Keep Ingress disabled because upstream currently emits root-relative UI,
  static-asset and API URLs and is not path-prefix aware.

## 0.1.0

- Initial Home Assistant OS App wrapper.
- `aarch64` support for Raspberry Pi 4.
- Persistent SQLite data under `/data`.
- Persistent generated token-encryption key.
- Web UI exposed on host port 8080.
- Upstream DNS service intentionally omitted.
- Optional MQTT settings included but disabled by default.
