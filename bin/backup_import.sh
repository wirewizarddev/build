#!/bin/bash
POSTGRES_USER=wirewizard
POSTGRES_DB=keys

container_id=$(docker ps -a --filter "name=container-wirewizard-postgres" --format "{{.ID}}")

docker cp /tmp/backup_wireguard.dump "$container_id":/tmp/backup_wireguard.dump
docker exec -it "$container_id" pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" /tmp/backup_wireguard.dump
