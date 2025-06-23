OCI = podman

push: build
	${OCI} push ghcr.io/vcd2df/CRAyoN:latest

build:
	${OCI} build . -t ghcr.io/vcd2df/CRAyoN:latest
