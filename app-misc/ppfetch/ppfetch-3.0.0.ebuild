# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/pedroportales/ppfetch/archive/refs/tags/v3.0.0.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/pedroportales/ppfetch"
fi

DESCRIPTION="A simple, basic, and posix fetch."
HOMEPAGE="https://github.com/pedroportales/ppfetch"
LICENSE="AGPL-3"
SLOT="0"
IUSE="X"

RDEPEND="X? ( x11-apps/xprop )"

src_install() {
	exeinto /usr/bin &&
		newexe ppfetch ppfetch ||
		die "Failed to install ppfetch"
}
