# Maintainer: Nick Pegg <aur@nickpegg.com>

pkgname=cinc-client
pkgver=15.8.23
pkgrel=1
_ubuntuver=xenial
pkgdesc="A free-as-in-beer distribution of the open source software of Chef Software Inc."
arch=('x86_64')
url="https://downloads.cinc.sh/cinc/"
license=('Apache')
depends=()
conflicts=( chef chef-solo chef-client )
source=("http://packages.cinc.sh/files/stable/cinc/15.8.23/ubuntu/18.04/cinc_15.8.23-1_amd64.deb")
sha256sums=('b88e6867b547f0eca3ac2cb57f73458e4993122672dfc35e7a5563221aac2e84')

package() {
  cd "$srcdir"
  tar -xf data.tar.xz -C "$pkgdir"

  # link executables
  binaries="chef-apply chef-shell knife chef-client chef-solo ohai"
  binaries="$binaries cinc-apply cinc-shell cinc-client cinc-solo"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/cinc/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod 755 $pkgdir/opt
}
