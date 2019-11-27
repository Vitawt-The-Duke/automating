#!/bin/bash
COMPNAME="$1"
apt update && apt upgrade -y
apt install -y mc nano htop fail2ban ufw
ufw default deny incoming && ufw default allow outgoing && ufw allow ssh && ufw --force enable && ufw status numbered
hostnamectl set-icon-name "$COMPNAME" && hostnamectl set-hostname "$COMPNAME" && hostnamectl set-hostname "$COMPNAME" –-static && hostnamectl set-hostname "$COMPNAME" --pretty
cd /etc/fail2ban
wget https://raw.githubusercontent.com/Vitawt-The-Duke/fail2ban-gitlab/master/gitlab-jail-statuses.sh
