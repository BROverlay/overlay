# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module

DESCRIPTION="Disk Usage/Free Utility - a better 'df' alternative"
HOMEPAGE="https://github.com/muesli/duf"
LICENSE="MIT"
SRC_URI="https://github.com/muesli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
https://github.com/BROverlay/broverlay-vendored/releases/download/v1.0.0/${P}-deps.tar.xz -> ${P}-vendor.tar.xz"

KEYWORDS="~amd64 ~x86"
SLOT="0"

src_compile(){
	go build . || die
}

src_install(){
	einstalldocs
	dobin duf
}
