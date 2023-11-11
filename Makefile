# Makefile for gh-cli

BASEDIR ?= $(PWD)

APPNAME ?= gh
APPVER ?= 2.29.0

.PHONY: all
all: build


.PHONY: build
build:
	docker image build --build-arg GH_VERSION=${APPVER} --tag "$(APPNAME):dev" "$(BASEDIR)"


.PHONY: buildx
buildx:
	-docker buildx create --name $(APPNAME)-buildx
	docker buildx use $(APPNAME)-buildx


.PHONY: publish-docker
publish: buildx
	docker buildx build --push \
    --build-arg GH_VERSION=$(APPVER) \
		--platform linux/amd64,linux/arm64 \
		--tag "jheddings/$(APPNAME):$(APPVER)" \
		--tag "jheddings/$(APPNAME):latest" \
		"$(BASEDIR)"
