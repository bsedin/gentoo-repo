# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 multilib savedconfig toolchain-funcs

DESCRIPTION="Simple terminal implementation for X with Xresources support and other patches"
HOMEPAGE="https://github.com/gnotclub/xst"
EGIT_REPO_URI="${HOMEPAGE}"

SLOT="0"
LICENSE="MIT-with-advertising"

IUSE="savedconfig"

RDEPEND="
	>=sys-libs/ncurses-6.0:0=
	media-libs/fontconfig
	x11-libs/libX11
	x11-libs/libXft
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	x11-base/xorg-proto
"


src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	make_desktop_entry ${PN} xst utilities-terminal 'System;TerminalEmulator;' ''
}


pkg_postinst() {
	if ! [[ "${REPLACING_VERSIONS}" ]]; then
		elog "Please ensure a usable font is installed, like"
		elog "    media-fonts/terminus-font"
		elog "    media-fonts/dina"
	fi
}
