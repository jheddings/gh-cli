# Makefile for gh-cli

BASEDIR ?= $(PWD)

# the version is determined by the current version in the Alpine package
APPNAME ?= gh
APPVER ?= $(shell docker run --entrypoint apk --rm gh:dev list github-cli | awk '-F[ -]' '{printf "%s-%s",$$3,$$4}')

.PHONY: all
all: build


.PHONY: build
build:
	docker image build --tag "$(APPNAME):dev" "$(BASEDIR)"


.PHONY: release
release: build
	git tag "v$(APPVER)" main
	git push origin "v$(APPVER)"
