# -*-makefile-*-
#
# Copyright (C) 2022 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PYTHON3_GW4XXX_LONG_TERM_TEST) += python3-gw4xxx-long-term-test

#
# Paths and names
#
PYTHON3_GW4XXX_LONG_TERM_TEST_VERSION	:= 0.1.3
PYTHON3_GW4XXX_LONG_TERM_TEST_MD5	:= b337275bd6e8aab42f94cec919c7a98b
PYTHON3_GW4XXX_LONG_TERM_TEST		:= gw4xxx-long-term-test-$(PYTHON3_GW4XXX_LONG_TERM_TEST_VERSION)
PYTHON3_GW4XXX_LONG_TERM_TEST_SUFFIX	:= tar.gz
PYTHON3_GW4XXX_LONG_TERM_TEST_URL	:= https://api.github.com/repos/iotmaxx/gw4xxx-long-term-test/tarball/$(PYTHON3_GW4XXX_LONG_TERM_TEST_VERSION)
PYTHON3_GW4XXX_LONG_TERM_TEST_SOURCE	:= $(SRCDIR)/$(PYTHON3_GW4XXX_LONG_TERM_TEST).$(PYTHON3_GW4XXX_LONG_TERM_TEST_SUFFIX)
PYTHON3_GW4XXX_LONG_TERM_TEST_DIR	:= $(BUILDDIR)/$(PYTHON3_GW4XXX_LONG_TERM_TEST)
PYTHON3_GW4XXX_LONG_TERM_TEST_LICENSE	:= unknown
PYTHON3_GW4XXX_LONG_TERM_TEST_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(PYTHON3_GW4XXX_LONG_TERM_TEST_SOURCE):
	@$(call targetinfo)
	@$(call gh_token_get, PYTHON3_GW4XXX_LONG_TERM_TEST)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------
$(STATEDIR)/python3-gw4xxx-long-term-test.extract:
	@$(call targetinfo)
	@$(call clean, $(PYTHON3_GW4XXX_LONG_TERM_TEST_DIR))
	@$(call gh_token_extract, PYTHON3_GW4XXX_LONG_TERM_TEST)
	@$(call patchin, $(PYTHON3_GW4XXX_LONG_TERM_TEST))
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_GW4XXX_LONG_TERM_TEST_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_GW4XXX_LONG_TERM_TEST_CONF_TOOL	:= python3
#PYTHON3_GW4XXX_LONG_TERM_TEST_CONF_OPT	:= 

#$(STATEDIR)/python3-gw4xxx-long-term-test.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_GW4XXX_LONG_TERM_TEST)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-long-term-test.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_GW4XXX_LONG_TERM_TEST)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-long-term-test.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_GW4XXX_LONG_TERM_TEST)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-gw4xxx-long-term-test.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-gw4xxx-long-term-test)
	@$(call install_fixup, python3-gw4xxx-long-term-test,PRIORITY,optional)
	@$(call install_fixup, python3-gw4xxx-long-term-test,SECTION,base)
	@$(call install_fixup, python3-gw4xxx-long-term-test,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-gw4xxx-long-term-test,DESCRIPTION,missing)

	@$(call install_copy, python3-gw4xxx-long-term-test, 0, 0, 0755, $(PYTHON3_GW4XXX_LONG_TERM_TEST_DIR)/root/etc/rc.once.d/long_test_create_service, /etc/rc.once.d/long_test_create_service)
	@$(call install_glob, python3-gw4xxx-long-term-test, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-gw4xxx-long-term-test)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-gw4xxx-long-term-test.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_GW4XXX_LONG_TERM_TEST)

# vim: syntax=make
