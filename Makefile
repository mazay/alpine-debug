DOCKER_PLATFORMS=linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64/v8,linux/386,linux/ppc64le
DOCKER_IMAGE_NAME=${DOCKER_BASE_REPO}:${RELEASE_VERSION}

# Set docker repo to Docker Hub if nothing else provided
ifndef DOCKER_BASE_REPO
DOCKER_BASE_REPO=zmazay/alpine-debug
endif

# Validate build arguments
ifndef RELEASE_VERSION
$(error RELEASE_VERSION value is not set)
endif

docker:
	DOCKER_CLI_EXPERIMENTAL=enabled
	docker buildx create --use
	docker buildx build \
	--build-arg RELEASE_VERSION=${RELEASE_VERSION} \
	--push \
	--tag $(DOCKER_IMAGE_NAME) -f ./Dockerfile .
	docker buildx rm

docker-multi-arch:
	DOCKER_CLI_EXPERIMENTAL=enabled
	docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
	docker buildx create --use
	docker buildx build \
	--build-arg RELEASE_VERSION=${RELEASE_VERSION} \
	--push \
	--platform $(DOCKER_PLATFORMS) \
	--tag $(DOCKER_IMAGE_NAME) -f ./Dockerfile .
	docker buildx rm
