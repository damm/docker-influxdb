FROM debian:jessie
ADD http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb /influxdb_latest_amd64.deb
RUN dpkg -i /influxdb_latest_amd64.deb
RUN mkdir -p /opt/influxdb/shared/data
ADD config.toml /opt/influxdb/shared/config.toml
ADD run.sh /run.sh
RUN chmod +x /run.sh
ADD su /etc/pam.d/su
ADD influxdb.conf /etc/security/limits.d/influxdb.conf
EXPOSE 8083 8086 2003
ENTRYPOINT ["/run.sh"]
