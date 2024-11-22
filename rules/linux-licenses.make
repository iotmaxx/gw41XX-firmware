# -*-makefile-*-
#
# Copyright (C) 2024 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_LINUX_LICENSES) += linux-licenses

#
# Paths and names
#
LINUX_LICENSES_VERSION	:= 0.1.0
LINUX_LICENSES		:= linux-licenses-$(LINUX_LICENSES_VERSION)
LINUX_LICENSES_DIR       := local_src/licenses
LINUX_LICENSES_LICENSE  := ignore

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(LINUX_LICENSES_SOURCE):
#	@$(call targetinfo)
#	@$(call get, LINUX_LICENSES)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

LINUX_LICENSES_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
LINUX_LICENSES_CONF_TOOL	:= NO
#LINUX_LICENSES_CONF_OPT	:= 

#$(STATEDIR)/linux-licenses.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, LINUX_LICENSES)
#	mkdir -p $(LINUX_LICENSES_DIR)
#	echo  $(ptxd_make "/print-PACKAGES")
#	ptxdist list-packages | xargs ptxdist package-info | grep -e package: -e version: -e license: | awk '{ if ($1 == "package:") print ""; else printf ","; $1=""; printf $0}' > linux-versions.csv
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/linux-licenses.compile:
	@$(call targetinfo)
#	@$(call world/compile, LINUX_LICENSES)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/linux-licenses.install:
	@$(call targetinfo)
#	@$(call world/install, LINUX_LICENSES)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/linux-licenses.targetinstall:
	@$(call targetinfo)

	@$(call install_init, linux-licenses)
	@$(call install_fixup, linux-licenses,PRIORITY,optional)
	@$(call install_fixup, linux-licenses,SECTION,base)
	@$(call install_fixup, linux-licenses,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, linux-licenses,DESCRIPTION,missing)

	@$(call install_copy, linux-licenses, 0, 0, 0644, $(LINUX_LICENSES_DIR)/linux_licenses.csv, /usr/share/webconfig/linux_licenses.csv)

	@$(call install_finish, linux-licenses)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/linux-licenses.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, LINUX_LICENSES)

# vim: syntax=make
