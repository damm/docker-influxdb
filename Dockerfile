FROM debian:jessie
RUN apt-get update && apt-get install -y wget
RUN wget http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb -O /influxdb_latest_amd64.deb
RUN dpkg -i /influxdb_latest_amd64.deb
RUN rm -rf /opt/influxdb/shared/data
ADD config.toml /opt/influxdb/shared/config.toml
EXPOSE 8083 8086 2003

VOLUME "/opt/influxdb/shared"
CMD ["-config=/opt/influxdb/shared/config.toml"]
ENTRYPOINT ["/usr/bin/influxdb"]
