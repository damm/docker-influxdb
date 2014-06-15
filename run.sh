#!/bin/sh
set -e
chown -R influxdb:influxdb /opt/influxdb
su - influxdb -c '/usr/bin/influxdb -config=/opt/influxdb/shared/config.toml'
