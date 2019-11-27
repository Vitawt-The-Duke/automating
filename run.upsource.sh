#!/bin/bash
UPSOURCEVER="2019.1.1556"
REMOTEHOST="$1"
EXTPORT="$2"
####################################
mkdir /upsource
cd /upsource
mkdir -p -m 750 data logs conf backups
ufw allow from $"REMOTEHOST"/32 to any port $"EXTPORT"
docker run -it --name upsource1 --memory=7g \
-v /upsource/data:/opt/upsource/data \
-v /upsource/conf:/opt/upsource/conf \
-v /upsource/logs:/opt/upsource/logs \
-v /upsource/packups:/opt/upsource/backups \
-p $"EXTPORT":8080 \
jetbrains/upsource:jetbrains/upsource:$"UPSOURCEVER"
