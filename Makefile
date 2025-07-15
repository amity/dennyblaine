SHELL := /bin/bash

# Run 'make help' in the terminal to see a list of script options
.PHONY: help
help: ## Show help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## builds the development docker image
	docker build -f Dockerfile.dev -t static-site .

.PHONY: dev
dev: build ## serves the website for development purposes
	docker run --rm --name denny-blaine -p 8090:8080 -v .:/app static-site