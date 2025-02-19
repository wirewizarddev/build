docker-build-backup:
	docker build -f ./docker/Dockerfile.backup -t wirewizard-postgres .

docker-build:
	docker build -f ./docker/Dockerfile.init -t wirewizard-postgres .

docker-start:
	docker run -d -p 5432:5432 --name container-wirewizard-postgres -e POSTGRES_PASSWORD=ww wirewizard-postgres

docker: docker-build docker-start

docker-backup: docker-build-backup docker-start
