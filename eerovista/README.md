# eeroVista

Runs eeroVista as a Home Assistant App.

eeroVista provides read-only Eero mesh monitoring, historical data, node restart detection, topology visualization, JSON APIs, and optional MQTT/Home Assistant discovery.

After installation, start the App and use **Open Web UI** to complete eeroVista's Eero authentication wizard.

Home Assistant Ingress is enabled through an internal compatibility proxy, so
the sidebar shortcut follows the Home Assistant URL on both LAN and Tailscale.
Enable **Show in sidebar** on the App information page after updating.

Direct access remains available on host port 8780 as a fallback and can be
changed in the App's Network settings.
