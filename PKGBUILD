# Maintainer: Bernd Busse <bernd AT bussenet DOT de>

pkgname=pun-git
_pkgname=pun
pkgver=v0.2.c0b4de1
_pkgver=v0.2
pkgrel=1
pkgdesc="notifier for system updates (systemd, mail)"
arch=('any')
url="https://github.com/nullbleed/pun"
license=('LGPL3')
depends=('pacman' 'package-query')
makedepends=('git')
source=('git://github.com/nullbleed/pun.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  _gitver="$(git describe --always | sed 's|-|.|g')"
  echo "$_pkgver.$_gitver"
}

package() {
  cd "$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm755 "pun" "$pkgdir/usr/bin/pun"

  install -Dm644 "pun.service" "$pkgdir/usr/lib/systemd/system/pun.service"
  install -Dm644 "pun.timer" "$pkgdir/usr/lib/systemd/system/pun.timer"

  install -d "$pkgdir/var/lib/pun/"
}

# vim:set ts=2 sw=2 et:
