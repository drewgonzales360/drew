SHELL 	:= /bin/bash
DATE = $(shell date "+%Y%m%d")
VERSION="1.0.${DATE}"

.PHONY:open
open:
	docker run --rm -it drewgonzales360/drew:latest

.PHONY: build
build:
	@docker build -t drewgonzales360/drew .

.PHONY: push
push:
	@docker tag drewgonzales360/drew:latest "drewgonzales360/drew:${VERSION}"
	@echo "Pushing "drewgonzales360/drew:${VERSION}" to hub.docker.com"
	@docker push "drewgonzales360/drew:${VERSION}"
	@docker push "drewgonzales360/drew:latest"
