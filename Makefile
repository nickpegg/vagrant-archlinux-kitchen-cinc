all: package.box

package.box:
	vagrant box update --box archlinux/archlinux
	vagrant up --provision
	vagrant package

publish: package.box
	vagrant cloud publish nickpegg/archlinux-kitchen-cinc $$(date +%Y.%m.%d) virtualbox package.box
	vagrant cloud version release nickpegg/archlinux-kitchen-cinc $$(date +%Y.%m.%d)

# Install locally
install: package.box
	vagrant box add package.box --provider virtualbox --name nickpegg/archlinux-kitchen-cinc -f

clean:
	vagrant destroy -f
	rm package.box || true
