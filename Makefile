target = override

override container-name-app = ansible
override docker-compose = docker compose -f docker-compose.yml -f docker-compose.$(target).yml

default: docker-build docker-up

# Docker

docker-ps: FORCE ; $(docker-compose) ps
docker-images: FORCE ; $(docker-compose) images
docker-build: FORCE ; $(docker-compose) build --pull
docker-up: FORCE ; $(docker-compose) up -d --remove-orphans --no-build
docker-down: FORCE ; $(docker-compose) down --remove-orphans
docker-push: FORCE ; $(docker-compose) push
docker-pull: FORCE ; $(docker-compose) pull
docker-logs: FORCE ; $(docker-compose) logs -f
docker-run: FORCE ; $(docker-compose) run --rm $(container-name-app) sh
docker-remove-all: FORCE ; $(docker-compose) rm -f -s -v

# Hack

FORCE:
