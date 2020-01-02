# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="Simple GOG client for Linux"
HOMEPAGE="http://github.com/sharkwouter/minigalaxy"

if [[ ${PV} == *9999* ]] ; then
    EGIT_REPO_URI="https://github.com/github.com/sharkwouter/minigalaxy.git"
    inherit git-r3
else
    SRC_URI="https://github.com/sharkwouter/${PN}/archive/${PV}.tar.gz"
fi

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-python/pygobject-3.30[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=x11-libs/gtk+-3
	>=net-libs/webkit-gtk-2.6
"
RDEPEND="${DEPEND}"
