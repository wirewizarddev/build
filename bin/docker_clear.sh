#!/bin/bash
container_id=$(docker ps -a --filter "name=container-wirewizard-postgres" --format "{{.ID}}")
volume_name=$(docker volume ls --quiet)

docker stop $container_id
docker rm $container_id
docker volume rm $volume_name
docker rmi wirewizard-postgres
