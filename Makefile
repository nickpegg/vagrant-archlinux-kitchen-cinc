all: package.box

package.box:
	vagrant up --provision
	vagrant package

clean:
	vagrant destroy -f
	rm package.box
