export COMPOSE_DOCKER_CLI_BUILD := "1"
export DOCKER_BUILDKIT := "1"

export UID := `id -u`
export GID := `id -g`
export CURRENT_USER := UID + ":" + GID

DOCKER := "docker-compose run --rm notebook"

run:
	docker-compose up --detach --remove-orphans
	sleep 5
	docker-compose exec notebook jupyter notebook list \
	    | grep "?token" \
	    | cut -f 1 -d " " \
	    | xargs open

down:
	docker-compose down

shell:
	{{DOCKER}} bash

