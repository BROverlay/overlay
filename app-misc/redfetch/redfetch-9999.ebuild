# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://codeberg.org/redson/${PN}"
else
	SRC_URI="https://codeberg.org/redson/Redfetch/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/redfetch"
fi

DESCRIPTION="A fast fetch written in C, with the ppfetch Ascii Art."
HOMEPAGE="https://codeberg.org/redson/Redfetch"
LICENSE="MIT"

SLOT="0"

KEYWORDS="~amd64"

RDEPEND=">=x11-misc/wmctrl-1.07-r3"

src_compile() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
