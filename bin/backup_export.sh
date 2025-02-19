#!/bin/bash
POSTGRES_USER=wirewizard
POSTGRES_DB=keys

container_id=$(docker ps -a --filter "name=container-wirewizard-postgres" --format "{{.ID}}")

docker exec -it "$container_id" pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" -t wireguard.servers -t wireguard.clients -Fc -f /tmp/backup_wireguard.dump
docker cp "$container_id":/tmp/backup_wireguard.dump /tmp/backup_wireguard.dump
