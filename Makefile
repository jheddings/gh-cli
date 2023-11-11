# Makefile for gh-cli

BASEDIR ?= $(PWD)

APPNAME ?= gh
APPVER ?= 2.29.0

.PHONY: all
all: build


.PHONY: build
build:
	docker image build --build-arg GH_VERSION=${APPVER} --tag "$(APPNAME):dev" "$(BASEDIR)"


.PHONY: release
release:
	git tag "v$(APPVER)" main
	git push origin "v$(APPVER)"
