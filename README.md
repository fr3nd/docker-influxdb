# InfluxDB Docker image 

## Description

InfluxDB is an open source distributed time series database with no external
dependencies. It's useful for recording metrics, events, and performing
analytics.

This image allows you to run CGP into a Docker container.

## How to run it

This image is pretty simple. It doesn't allow any configuration via environment
variables. Instead a config file needs to be specified if the default
configuration is not enough.

By default all data is stored in a volume in "/var/opt/influxdb".

Run InfluxDB with the default options:
```
docker run
  -name influxdb \
  -d \
  -p 8083:8083 \
  -p 8086:8086 \
  fr3nd/influxdb
```

Run InfluxDB with a customized config file and store all data in the parent
host

```
docker run
  -name influxdb \
  -d \
  -p 8083:8083 \
  -p 8086:8086 \
  -v /root/influxdb.conf:/etc/opt/influxdb/influxdb.conf:ro \
  -v /var/lib/influxdb:/var/opt/influxdb:rw \
  fr3nd/influxdb
```

To connect to a running InfluxDB instance:
```
docker exec -it influxdb /opt/influxdb/influx
```
