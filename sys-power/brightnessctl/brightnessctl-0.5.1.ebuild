# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev

DESCRIPTION="A program to read and control device brightness."
HOMEPAGE="https://github.com/Hummer12007/brightnessctl"
LICENSE="MIT"

SRC_URI="https://github.com/Hummer12007/brightnessctl/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"

KEYWORDS="~amd64 ~x86"

DEPEND="virtual/udev"

src_install() {
	dobin brightnessctl
	udev_dorules 90-brightnessctl.rules
	doman brightnessctl.1
}

pkg_postinst() {
	udev_reload
}
pkg_postrm() {
	udev_reload
}
