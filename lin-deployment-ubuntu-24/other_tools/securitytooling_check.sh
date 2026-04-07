#!/bin/bash

services=("ds_agent" "falcon-sensor" "qualys-cloud-agent")

printf "\n%-30s %-15s %-10s\n" "SERVICE" "STATUS" "ACTIVE"
printf "%-30s %-15s %-10s\n" "------------------------------" "---------------" "----------"

for svc in "${services[@]}"; do
    status=$(systemctl is-active "$svc" 2>/dev/null)
    enabled=$(systemctl is-enabled "$svc" 2>/dev/null)
    printf "%-30s %-15s %-10s\n" "$svc" "$status" "$enabled"
done

echo
