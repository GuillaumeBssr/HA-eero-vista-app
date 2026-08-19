# Changelog

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
