all:

build:
	bash -ex scripts/prepare_container.sh
	bash -ex scripts/prepare_trigger.sh

install:
	cp -r bin/* /usr/bin

