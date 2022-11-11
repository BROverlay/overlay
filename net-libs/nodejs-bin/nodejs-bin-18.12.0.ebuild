# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A JavaScript runtime built on Chrome's V8 JavaScript engine"
HOMEPAGE="https://nodejs.org/"
LICENSE="Apache-1.1 Apache-2.0 BSD BSD-2 MIT"

SRC_URI="https://nodejs.org/dist/v18.12.0/node-v18.12.0-linux-x64.tar.xz -> ${P}.tar.xz"
KEYWORDS="-* ~amd64"
SLOT="0"

S="${WORKDIR}/node-v${PV}-linux-x64"

IUSE="doc"

RDEPEND=">=app-arch/brotli-1.0.9:=
	>=dev-libs/libuv-1.40.0:=
	>=net-dns/c-ares-1.17.2:=
	>=net-libs/nghttp2-1.41.0:=
	sys-libs/zlib
	>=dev-libs/icu-67:=
	>=dev-libs/openssl-1.1.1:0=
	sys-devel/gcc:*"

DEPEND="${RDEPEND}"

src_install(){
	# Install Node
	dobin "${S}"/bin/node
	# Libraries
	insinto "/usr/lib" &&
		doins -r "${S}"/lib/* ||
		die "Error installing libraries."

	# FIX: Those symlinks are broken due to wrong permissions, set by our friend, portage. Thank you portage.
	# I'll figure it out soon.
	dosym "/usr/lib/node_modules/corepack/dist/corepack.js" "/usr/bin/corepack"
	dosym "/usr/lib/node_modules/npm/bin/npm-cli.js" "/usr/bin/npm"
	dosym "/usr/lib/node_modules/npm/bin/npx-cli.js" "/usr/bin/npx"

	doheader -r "${S}"/include/*
	default

	if use doc; then
		dodoc -r "${S}"/share/doc/*
		doman "${S}"/share/man/man1/node.1
		# NPM
		doman "${S}"/lib/node_modules/npm/man{1,5,7}/*
	fi
}
