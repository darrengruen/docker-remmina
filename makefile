BUILD_DATE = $$(date -u +%FT%T.%S%Z)
GIT_SHA = $$(git rev-parse --short HEAD)
NAMESPACE = gruen
IMAGE = remmina
REPOSITORY = $(NAMESPACE)/$(IMAGE)
TAG = $$(git rev-parse --abbrev-ref HEAD)
FILTER = "label=org.label-schema.name=remmina"

build: .build ## Builds the image

clean: .clean ## Cleans up everything related to this image

help: .help ## Outputs this help message

run: .run ## Run the container

.build:
	@docker build \
	    --build-arg BUILD_DATE=$(BUILD_DATE) \
	    --build-arg GIT_SHA=$(GIT_SHA) \
	    -t $(REPOSITORY):$(TAG) \
	    .
	
.clean:
    # Cleans up the images
    ifneq ($(shell docker images -f $(FILTER) --format "{{.ID}}"),)
	@docker rmi -f $$(docker images -f $(FILTER) --format "{{.ID}}")
    endif
    # Cleans up the containers
    ifneq ($(shell docker ps -a -f $(FILTER) --format "{{.Names}}"),)
	@docker rm -f $$(docker ps -a -f $(FILTER) --format "{{.Names}}")
    endif

.help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "- \033[36m%-20s\033[0m %s\n", $$1, $$2}' ${MAKEFILE_LIST}

.run: .build
	docker run -d \
	    -v /etc/localtime:/etc/localtime:ro \
	    -v /tmp/.X11-unix:/tmp/.X11-unix \
	    -e DISPLAY=unix"${DISPLAY}" \
	    --name remmina_"$$(date +%s)" \
	    $(REPOSITORY):$(TAG)
    
.PHONY: build clean help run
