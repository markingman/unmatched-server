# Makefile for local development

.DEFAULT_GOAL := help

-include ./.env
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ": ## "}; {printf "\033[36m%-28s\033[0m %s\n", $$1, $$2}' | sed 's/Makefile://g'

test:
	@echo $(PROJECT)

cert: ## Create self-signed certificate
	@sh ./make_cert.sh

conf: ## Compile nginx config
	@sh ./make_config.sh

tidy: ## Remove created and compiled files
	@rm nginx.key nginx.crt nginx.conf

build: ## Docker build for localhost dev
	@docker build --no-cache -t $(TAG) .

run: ## Docker run for localhost dev
	@docker run --rm -d -p 443:443 $(TAG)
