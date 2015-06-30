# Maintainer: Bernd Busse <bernd AT bussenet DOT de>

pkgname=pun-git
_pkgname=pun
pkgver=v0.8
pkgrel=1
pkgdesc="notifier for system updates (systemd, mail)"
arch=('any')
url="https://github.com/nullbleed/pun"
license=('LGPL3')
depends=('pacman' 'package-query')
optdepends=('mail: sendmail support (provides mail)'
            'mutt: sendmail support (provides mail)'
            'curl: send telegram messages'
            'python: search your telegram id')
provides=('pun')
makedepends=('git')
install='pun.install'
source=('git://github.com/nullbleed/pun.git'
        'pun.install')
sha256sums=('SKIP'
            'a6ca2db25ac9f5bff64e71b839e368c425c9a912c8992b4412385174e8fc3b4c')

pkgver() {
  cd "$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$_pkgname"
  sed -ie 's_/usr/local/bin_/usr/bin_g' pun.service
}

package() {
  cd "$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm755 pun "$pkgdir/usr/bin/pun"
  install -Dm755 pun-search-telegram-id.py "$pkgdir/usr/bin/pun-search-telegram-id"
  install -Dm644 pun.conf "$pkgdir/etc/pun.conf"

  install -Dm644 pun.service "$pkgdir/usr/lib/systemd/system/pun.service"
  install -Dm644 pun.timer "$pkgdir/usr/lib/systemd/system/pun.timer"

  install -d "$pkgdir/var/lib/pun/"
}

# vim:set ts=2 sw=2 et:
