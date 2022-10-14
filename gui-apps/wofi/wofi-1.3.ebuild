# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Wofi is a launcher/menu program for wlroots based wayland compositors such as sway"
HOMEPAGE="https://hg.sr.ht/~scoopta/wofi"
LICENSE="GPL-3"
SLOT="0"
KEYWORD="~amd64 ~x86"

SRC_URI="https://hg.sr.ht/~scoopta/wofi/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-v${PV}"

IUSE="+run +drun dmenu"

RDEPEND="
	dev-libs/wayland
	=x11-libs/gtk+-3*"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure(){
	local emesonargs=(
		$(meson_use run enable_run)
		$(meson_use drun enable_drun)
		$(meson_use dmenu enable_dmenu)
	)
	meson_src_configure
}

src_compile(){
	meson_src_compile
}
src_install(){
	meson_src_install
}
