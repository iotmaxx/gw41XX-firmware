#!/bin/bash
#
# Copyright (C) 2020 by Steffen Trumtrar <s.trumtrar@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

ptxd_make_vcs_version() {
    PTXDIST_VCS_VERSION="$(echo $(git describe 2>/dev/null || git describe --always --tags))"

    if [ -z "${PTXDIST_VCS_VERSION}" ]; then
       PTXDIST_BUILD_VERSION_VCS="unknown"
    fi

    export PTXDIST_VCS_VERSION
}
export -f ptxd_make_vcs_version

ptxd_make_vcs_version
