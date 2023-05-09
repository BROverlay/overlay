# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Turn your phone into a microphone or speakers for PC"
HOMEPAGE="https://audiorelay.net"
LICENSE="all-rights-reserved"

SRC_URI="https://dl.audiorelay.net/setups/linux/${P}.tar.gz"
KEYWORDS="-* ~amd64"
SLOT="0"

S="${WORKDIR}"

RDEPEND="media-libs/alsa-lib
		dev-libs/libbsd
		sys-apps/dbus
		media-libs/flac
		sys-devel/gcc
		dev-libs/libgcrypt
		app-arch/lz4
		app-arch/xz-utils
		media-libs/libogg
		media-sound/pulseaudio
		media-libs/libsndfile
		media-libs/libvorbis
		x11-libs/libXau
		x11-libs/libxcb
		sys-libs/zlib"

DEPEND="${RDEPEND}"

src_install() {
	dobin "${S}"/bin/AudioRelay
	insinto /opt/audiorelay
	doins -r bin lib

	newicon lib/AudioRelay.png AudioRelay.png

	make_desktop_entry audiorelay AudioRelay AudioRelay
}
