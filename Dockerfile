FROM debian:jessie
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN apt-get update && apt-get install -y \
      curl \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/*

ENV INFLUXDB_VERSION 0.9.4.1

RUN curl -L -o /tmp/influxdb_${INFLUXDB_VERSION}_amd64.deb https://s3.amazonaws.com/influxdb/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    dpkg -i /tmp/influxdb_${INFLUXDB_VERSION}_amd64.deb && \
    rm -f  /tmp/influxdb_${INFLUXDB_VERSION}_amd64.deb
COPY influxdb.conf /etc/opt/influxdb/influxdb.conf


EXPOSE 8086
EXPOSE 8083

VOLUME /var/opt/influxdb

CMD /opt/influxdb/influxd -config /etc/opt/influxdb/influxdb.conf
