all: package.box

package.box:
	vagrant up --provision
	vagrant package

publish:
	vagrant cloud publish nickpegg/archlinux-cinc $(date +%Y.%m.%d) virtualbox package.box
	vagrant cloud version release nickpegg/archlinux-cinc $(date +%Y.%m.%d)

clean:
	vagrant destroy -f
	rm package.box || true
