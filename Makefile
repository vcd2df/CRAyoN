OCI = podman

push: build
	${OCI} push ghcr.io/vcd2df/crayon:latest

build:
	${OCI} build . -t ghcr.io/vcd2df/crayon:latest
