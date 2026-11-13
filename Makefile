.PHONY: help build up down shell ssh render clean

help: ## show the commands
	@grep -E '^[a-z]+:' Makefile

build: ## build the image
	docker compose build

up: ## start the container, ready for ssh
	docker compose up --detach

down: ## stop and remove the container
	docker compose down

shell: ## open a terminal in the running container
	docker compose exec analysis-env bash

# skip the host key check: it can change when the image is rebuilt
ssh: ## log in to the container
	ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@localhost

render: ## render the reports, in a new container
	docker compose run --rm analysis-env uv run quarto render

clean: ## delete the rendered reports
	rm -f reports/*.html reports/*.pdf
