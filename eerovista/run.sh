#!/bin/sh
set -eu

OPTIONS_FILE="/data/options.json"

get_opt() {
    key="$1"
    default="$2"
    python3 - "$OPTIONS_FILE" "$key" "$default" <<'PY'
import json, sys
path, key, default = sys.argv[1:4]
try:
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
    value = data.get(key, default)
except Exception:
    value = default

if isinstance(value, bool):
    print("true" if value else "false")
else:
    print(value)
PY
}

export TZ="$(get_opt timezone Europe/Paris)"
export COLLECTION_INTERVAL_DEVICES="$(get_opt collection_interval_devices 30)"
export COLLECTION_INTERVAL_NETWORK="$(get_opt collection_interval_network 60)"
export DATA_RETENTION_RAW_DAYS="$(get_opt data_retention_raw_days 7)"
export DATA_RETENTION_HOURLY_DAYS="$(get_opt data_retention_hourly_days 30)"
export DATA_RETENTION_DAILY_DAYS="$(get_opt data_retention_daily_days 365)"
export WEB_CONCURRENCY="$(get_opt web_concurrency 2)"
export LOG_LEVEL="$(get_opt log_level INFO)"
export UVICORN_LOG_LEVEL="$(printf '%s' "${LOG_LEVEL}" | tr '[:upper:]' '[:lower:]')"

export MQTT_ENABLED="$(get_opt mqtt_enabled false)"
export MQTT_BROKER="$(get_opt mqtt_broker core-mosquitto)"
export MQTT_PORT="$(get_opt mqtt_port 1883)"
export MQTT_USERNAME="$(get_opt mqtt_username '')"
export MQTT_PASSWORD="$(get_opt mqtt_password '')"
export MQTT_TOPIC_PREFIX="$(get_opt mqtt_topic_prefix eerovista)"
export MQTT_DISCOVERY_PREFIX="$(get_opt mqtt_discovery_prefix homeassistant)"
export MQTT_PUBLISH_INTERVAL="$(get_opt mqtt_publish_interval 60)"

# eeroVista encrypts its stored Eero session token. Generate a stable key once
# and persist it in the Home Assistant App data directory.
KEY_FILE="/data/.eerovista_encryption_key"
if [ ! -s "$KEY_FILE" ]; then
    python3 - <<'PY' > "$KEY_FILE"
from cryptography.fernet import Fernet
print(Fernet.generate_key().decode())
PY
    chmod 600 "$KEY_FILE"
fi
export ENCRYPTION_KEY="$(cat "$KEY_FILE")"

echo "Starting eeroVista"
echo "Timezone: ${TZ}"
echo "Device collection interval: ${COLLECTION_INTERVAL_DEVICES}s"
echo "Network collection interval: ${COLLECTION_INTERVAL_NETWORK}s"
echo "Web workers: ${WEB_CONCURRENCY}"
echo "MQTT enabled: ${MQTT_ENABLED}"

cd /app

# eeroVista deliberately separates collection from the multi-worker web
# process. Running only Uvicorn would serve the UI but collect no history.
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/eerovista.conf
