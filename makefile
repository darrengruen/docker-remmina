CONTAINER_NAME = remmina
VERSION = $$(git rev-parse --abbrev-ref HEAD) 

default: help ## help

# HELP
# Output the help for each task
help: ## Output the help for each task
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "- \033[36m%-20s\033[0m %s\n", $$1, $$2}' ${MAKEFILE_LIST}

builddev: ## Build a local dev version of the image (*:dev-latest)
	docker build \
		--build-arg BUILD_DATE=$(BUILD_LABEL) \
		--build-arg GIT_SHA=$$(git rev-parse --short HEAD) \
		-t ${PWD##*/}:$(VERSION) \
		.
	
.PHONY: help
