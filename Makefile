all: package.box

VERSION := $(shell date +%Y.%m.%d).$(shell cat build)

package.box:
	vagrant box update --box archlinux/archlinux
	vagrant up --provision
	vagrant package

	# Update build version
	expr $(shell cat build) + 1 | tee build

publish: package.box
	vagrant cloud publish nickpegg/archlinux-kitchen-cinc ${VERSION} virtualbox package.box
	vagrant cloud version release nickpegg/archlinux-kitchen-cinc ${VERSION}

# Install locally
install: package.box
	vagrant box add package.box --provider virtualbox --name nickpegg/archlinux-kitchen-cinc -f

clean:
	vagrant destroy -f
	rm package.box || true
