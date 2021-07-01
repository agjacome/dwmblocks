# Maintainer: Alberto G. Jácome (agjacome) <contact@agjacome.dev>
pkgname=dwmblocks-agjacome
pkgver=r37.60d623a
pkgrel=1
pkgdesc="Customized build of dwmblocks to suit my own needs"
arch=(x86_64 i686)
url="https://github.com/agjacome/dwmblocks"
license=('GPL2')
groups=()
depends=(libx11)
makedepends=()
checkdepends=()
optdepends=()
provides=(dwmblocks)
conflicts=(dwmblocks)
replaces=()
backup=()
options=()
source=("git+$url.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$srcdir/${pkgname%-agjacome}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-agjacome}"
    make
}

package() {
   cd "$srcdir/${pkgname%-agjacome}"

   make DESTDIR="${pkgdir}/" install
   install -Dm644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
