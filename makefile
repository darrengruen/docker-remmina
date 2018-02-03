# @awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "- \033[36m%-20s\033[0m %s\n", $$1, $$2}' ${MAKEFILE_LIST}
CONTAINER_NAME = remmina
VERSION = $$(git rev-parse --abbrev-ref HEAD) 
BUILD_LABEL = $$(gitref)
NAMESPACE=gruen

default: help ## help

# HELP
# Output the help for each task
help: ## Output the help for each task
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "- \033[36m%-20s\033[0m %s\n", $$1, $$2}' ${MAKEFILE_LIST}

build: ## Build a local dev version of the image (*:dev-latest)
	docker build \
		--build-arg BUILD_DATE=$$(date +%Y-%m-%d_%H%i%m) \
		--build-arg GIT_SHA=$$(git rev-parse --short HEAD) \
		-t $(NAMESPACE)/$${PWD##*/}:$(VERSION) \
		.

release: build ## Creates release version of file
	
.PHONY: help
