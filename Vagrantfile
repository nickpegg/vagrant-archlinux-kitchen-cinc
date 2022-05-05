# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"

  config.vm.provision "shell", inline: <<-SHELL
    pacman -Syyu
    pacman --noconfirm -S base-devel git

    # Accept older SSH keys
    echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/sshd_config

    sudo -u vagrant git clone https://github.com/nickpegg/arch-cinc-client.git /tmp/cinc
    cd /tmp/cinc
    sudo -u vagrant makepkg -si --noconfirm

    # Some linking required for Cinc client to work right
    ln -s /usr/lib/libcrypt.so.2 /opt/cinc/embedded/lib/libcrypt.so.1

    # Make sure cinc-client works
    cinc-client -h
  SHELL
end
