# -*-makefile-*-
#
# Copyright (C) 2023 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_CON_CHECK) += python3-gw4xxx-con-check

#
# Paths and names
#
PYTHON3_GW4XXX_CON_CHECK_VERSION	:= 0.1.3
PYTHON3_GW4XXX_CON_CHECK_MD5		:= 5b793d4e3feaa3627d090dfb9863e584
PYTHON3_GW4XXX_CON_CHECK		:= gw4xxx-con-check-$(PYTHON3_GW4XXX_CON_CHECK_VERSION)
PYTHON3_GW4XXX_CON_CHECK_SUFFIX		:= tar.gz
PYTHON3_GW4XXX_CON_CHECK_URL		:= https://api.github.com/repos/iotmaxx/gw4xxx-con-check/tarball/$(PYTHON3_GW4XXX_CON_CHECK_VERSION)
PYTHON3_GW4XXX_CON_CHECK_SOURCE		:= $(SRCDIR)/$(PYTHON3_GW4XXX_CON_CHECK).$(PYTHON3_GW4XXX_CON_CHECK_SUFFIX)
PYTHON3_GW4XXX_CON_CHECK_DIR		:= $(BUILDDIR)/$(PYTHON3_GW4XXX_CON_CHECK)
PYTHON3_GW4XXX_CON_CHECK_LICENSE	:= unknown
PYTHON3_GW4XXX_CON_CHECK_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(PYTHON3_GW4XXX_CON_CHECK_SOURCE):
#$(STATEDIR)/python3-gw4xxx-con-check.get:
	@$(call targetinfo)
	$(call gh_token_get, PYTHON3_GW4XXX_CON_CHECK)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------
$(STATEDIR)/python3-gw4xxx-con-check.extract:
	@$(call targetinfo)
	@$(call clean, $(PYTHON3_GW4XXX_CON_CHECK_DIR))
	$(call gh_token_extract, PYTHON3_GW4XXX_CON_CHECK)
	@$(call patchin, $(PYTHON3_GW4XXX_CON_CHECK))
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_CON_CHECK_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_CON_CHECK_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_CON_CHECK_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-con-check.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_CON_CHECK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-con-check.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_CON_CHECK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-con-check.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_CON_CHECK)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-con-check.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-con-check)
	@$(call install_fixup, python3-gw4xxx-con-check,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-con-check,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-con-check,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-con-check,DESCRIPTION,missing)

	@$(call install_copy, python3-gw4xxx-con-check, 0, 0, 0644, $(PYTHON3_GW4XXX_CON_CHECK_DIR)/root/etc/systemd/system/con_check.service, /etc/systemd/system/con_check.service)

	@$(call install_link, python3-gw4xxx-con-check, /etc/systemd/system/con_check.service, \
                /etc/systemd/system/multi-user.target.wants/con_check.service)

	@$(call install_copy, python3-gw4xxx-con-check, 0, 0, 0755, $(PYTHON3_GW4XXX_CON_CHECK_DIR)/root/etc/rc.once.d/con_check_create_service, /etc/rc.once.d/con_check_create_service)
	@$(call install_glob, python3-gw4xxx-con-check, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-gw4xxx-con-check)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-con-check.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_CON_CHECK)

# vim: syntax=make
