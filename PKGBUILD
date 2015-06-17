# Maintainer: Bernd Busse <bernd AT bussenet DOT de>

pkgname=cpun-git
_pkgname=cpun
pkgver=v0.1.c0b4de1
pkgrel=1
pkgdesc="cronjob/systemd-timer to notify about system updates"
arch=('any')
url="https://github.com/nullbleed/cpun"
license=('LGPL3')
depends=('pacman' 'package-query')
makedepends=('git')
source=('git://github.com/nullbleed/cpun.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm755 "cpun" "$pkgdir/usr/bin/cpun"

  install -Dm644 "cpun.service" "$pkgdir/usr/lib/systemd/system/cpun.service"
  install -Dm644 "cpun.timer" "$pkgdir/usr/lib/systemd/system/cpun.timer"
}

# vim:set ts=2 sw=2 et:
