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
PACKAGES-$(PTXCONF_PYTHON3_EXECUTE_START_SCRIPTS) += python3-execute-start-scripts

#
# Paths and names
#
PYTHON3_EXECUTE_START_SCRIPTS_VERSION		:= 0.1.4
PYTHON3_EXECUTE_START_SCRIPTS_MD5		:= ab38593c8412e032c82297e394e81143
PYTHON3_EXECUTE_START_SCRIPTS			:= execute-start-scripts-$(PYTHON3_EXECUTE_START_SCRIPTS_VERSION)
PYTHON3_EXECUTE_START_SCRIPTS_SUFFIX		:= tar.gz
PYTHON3_EXECUTE_START_SCRIPTS_URL		:= https://api.github.com/repos/iotmaxx/execute-start-scripts/tarball/$(PYTHON3_EXECUTE_START_SCRIPTS_VERSION)
PYTHON3_EXECUTE_START_SCRIPTS_SOURCE		:= $(SRCDIR)/$(PYTHON3_EXECUTE_START_SCRIPTS).$(PYTHON3_EXECUTE_START_SCRIPTS_SUFFIX)
PYTHON3_EXECUTE_START_SCRIPTS_DIR		:= $(BUILDDIR)/$(PYTHON3_EXECUTE_START_SCRIPTS)
PYTHON3_EXECUTE_START_SCRIPTS_LICENSE		:= unknown
PYTHON3_EXECUTE_START_SCRIPTS_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(PYTHON3_EXECUTE_START_SCRIPTS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, PYTHON3_EXECUTE_START_SCRIPTS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#PYTHON3_EXECUTE_START_SCRIPTS_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
PYTHON3_EXECUTE_START_SCRIPTS_CONF_TOOL	:= python3
#PYTHON3_EXECUTE_START_SCRIPTS_CONF_OPT	:= 

#$(STATEDIR)/python3-execute-start-scripts.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, PYTHON3_EXECUTE_START_SCRIPTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-execute-start-scripts.compile:
#	@$(call targetinfo)
#	@$(call world/compile, PYTHON3_EXECUTE_START_SCRIPTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-execute-start-scripts.install:
#	@$(call targetinfo)
#	@$(call world/install, PYTHON3_EXECUTE_START_SCRIPTS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/python3-execute-start-scripts.targetinstall:
	@$(call targetinfo)

	@$(call install_init, python3-execute-start-scripts)
	@$(call install_fixup, python3-execute-start-scripts,PRIORITY,optional)
	@$(call install_fixup, python3-execute-start-scripts,SECTION,base)
	@$(call install_fixup, python3-execute-start-scripts,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, python3-execute-start-scripts,DESCRIPTION,missing)

	@$(call install_copy, python3-execute-start-scripts, 0, 0, 0644, $(PYTHON3_EXECUTE_START_SCRIPTS_DIR)/etc/systemd/system/execute_start_scripts.service, /etc/systemd/system/execute_start_scripts.service)
	@$(call install_link, python3-execute-start-scripts, /etc/systemd/system/execute_start_scripts.service, \
                /etc/systemd/system/multi-user.target.wants/execute_start_scripts.service)
	@$(call install_glob, python3-execute-start-scripts, 0, 0, -, /usr/lib/python$(PYTHON3_MAJORMINOR)/site-packages/,,  *.py)

	@$(call install_finish, python3-execute-start-scripts)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/python3-execute-start-scripts.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, PYTHON3_EXECUTE_START_SCRIPTS)

# vim: syntax=make
