# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Adapted from the myMPD package's included ebuild

EAPI=7

inherit eutils user cmake systemd

MY_PN="myMPD"
S="${WORKDIR}/${MY_PN}-${PV}"

DESCRIPTION="myMPD is a standalone and mobile friendly web-based MPD client."
HOMEPAGE="https://jcorporation.github.io/myMPD"
SRC_URI="https://github.com/jcorporation/${MY_PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
IUSE="+flac +id3 java ssl systemd"

BDEPEND="
	>=dev-util/cmake-2.6
	java? ( || ( >=virtual/jre-1.7 >=virtual/jdk-1.7 ) )
	dev-lang/perl"

RDEPEND="
	ssl? ( >=dev-libs/openssl-1.1 )
	systemd? ( sys-apps/systemd )
		id3? ( media-libs/libid3tag )
		flac? ( media-libs/flac )"

src_compile() {
	default
	ENABLE_SSL=$(usex ssl "ON" "OFF")
	ENABLE_LIBID3TAG=$(usex id3 "ON" "OFF")
	ENABLE_FLAC=$(usex flac "ON" "OFF")
	./build.sh release
}

src_install() {
	cd release
	dobin mympd
	dobin cli_tools/mympd-config
	newinitd "contrib/initscripts/mympd.openrc" "${PN}"
	if use systemd; then
        systemd_newunit contrib/initscripts/mympd.service mympd.service
    fi
	${D}/usr/bin/mympd-config --mympdconf ${D}/etc/mympd.conf
	dodoc ${S}/README.md

	if [ $(getent passwd mympd) ]; then
		elog "User 'mympd' already exists."
	else
		enewuser mympd -1 -1 -1 audio
	fi
	if [ $(getent group mympd) ]; then
		elog "Group 'mympd' already exists."
	else
		enewgroup mympd
	fi
}

pkg_postinst() {
	elog
	elog "Modify /etc/mympd.conf to suit your needs or use the"
	elog "\`mympd-config\` tool to generate a valid mympd.conf"
	elog
}
