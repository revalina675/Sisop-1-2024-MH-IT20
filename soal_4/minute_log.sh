#!/bin/bash

#membuat command untuk pantau RAM usage
RAM_INFO=$(free -m)

# informasi RAM akan disimpan dalam file log
LOG_FILE="metrics_$(date +"%Y%m%d%H%M%S").log"
echo "$(date +"%Y-%m-%d %H:%M:%S") RAM Usage:
$RAM_INFO" >> ~/$LOG_FILE
