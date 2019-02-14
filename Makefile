.PHONY:open
open:
	docker run --rm -it drewgonzales360/drew:latest

.PHONY: build
build:
	@docker build -t drewgonzales360/drew .
