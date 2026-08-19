# eeroVista

Runs eeroVista as a Home Assistant App.

eeroVista provides read-only Eero mesh monitoring, historical data, node restart detection, topology visualization, JSON APIs, and optional MQTT/Home Assistant discovery.

After installation, start the App and use **Open Web UI** to complete eeroVista's Eero authentication wizard.

The default host port is 8780 and can be changed in the App's Network settings.
Home Assistant Ingress is not enabled because the current upstream UI is not
path-prefix aware.

To add an all-user sidebar shortcut, create a Home Assistant Webpage dashboard
pointing to `http://192.168.4.12:8780`, enable **Show in sidebar**, and leave
**Admin only** disabled.
