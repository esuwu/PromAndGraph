#!/bin/sh

ID=$(id -u) # saves your user id in the ID variable

PROM_DATA_DIR="/home/alexandr/Projects/PromAndGraph/prometheus/prom_db"

mkdir -p $PROM_DATA_DIR

sudo docker run \
        -d \
        --user $ID \
        -p 9090:9090 \
        --name prometheus \
        --network bridge \
        -v /home/alexandr/Projects/PromAndGraph/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
        -v /home/alexandr/Projects/PromAndGraph/prometheus/prom_db/:/prometheus/ \
        prom/prometheus
