#!/bin/sh
set -e
chown -R influxdb:influxdb /opt/influxdb
ulimit -Hn 10032
ulimit -Sn 10032
su - influxdb -c '/usr/bin/influxdb -config=/opt/influxdb/shared/config.toml'
