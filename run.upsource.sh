#!/bin/bash
UPSOURCEVER="$3"
REMOTEHOST="$1"
EXTPORT="$2"
####################################
#mkdir /upsource
#cd /upsource
#mkdir -p -m 750 data logs conf backups
ufw allow from "$REMOTEHOST"/32 to any port "$EXTPORT"
docker run --name upsource-$(date +"%M-%S_%d_%Y") --memory=7g -d  \
-v /upsource/data:/opt/upsource/data \
-v /upsource/conf:/opt/upsource/conf \
-v /upsource/logs:/opt/upsource/logs \
-v /upsource/backups:/opt/upsource/backups \
-p "$EXTPORT":8080 --ulimit nofile=65536:65536 \
-it jetbrains/upsource:"$UPSOURCEVER"
