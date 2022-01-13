# -*-makefile-*-
#
# Copyright (C) 2021 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_ANYVIZ) += anyviz

ANYVIZ_VERSION		:= 0.9.3.1
ANYVIZ_MD5		:= f6c69d0e5d5d1a6ae2d685942b478f65
ANYVIZ			:= anyviz-$(ANYVIZ_VERSION)
ANYVIZ_SUFFIX		:= tgz
#ANYVIZ_SERVICE  	:= anyviz.service
#ANYVIZ_SERVICE_URL	:= http://download.anyviz.io/anyviz/$(ANYVIZ_SERVICE)
ANYVIZ_URL		:= http://172.17.0.1:8080/anyviz/$(ANYVIZ).$(ANYVIZ_SUFFIX) # http://download.anyviz.io/anyviz/ARM/$(ANYVIZ)
ANYVIZ_DIR	:= $(BUILDDIR)/$(ANYVIZ)
ANYVIZ_SOURCE	:= $(SRCDIR)/$(ANYVIZ).$(ANYVIZ_SUFFIX)
# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/anyviz.get:
#	@$(call targetinfo)
#	@$(call get, ANYVIZ)
#	mkdir -p $(PTXDIST_WORKSPACE)/bin/$(ANYVIZ)
#	wget -q $(ANYVIZ_URL) -O $(PTXDIST_SYSROOT_TARGET)/bin/$(ANYVIZ)
#	wget -q $(ANYVIZ_SERVICE_URL) -O $(PTXDIST_SYSROOT_TARGET)/bin/$(ANYVIZ_SERVICE)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/anyviz.extract:
#	@$(call targetinfo)
#	@$(call touch)

#$(STATEDIR)/anyviz.extract.post:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/anyviz.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/anyviz.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/anyviz.install:
	@$(call targetinfo)

#
# TODO:
# If some of the files are required in root filesystem's build process, install
# these files in the install stage. But use proper variables PTXdist supports
# to install files, instead of fixed paths. The following variables can be
# used:
#
# - $(PTXDIST_SYSROOT_TARGET) points to a directory tree
#   all target relevant libraries and header files are installed to. All
#   packages built for the target are searching in this directory tree for
#   header and library files. These files are for compile time only, not for
#   runtime!
#   Paths:
#    - executables: $(PTXDIST_SYSROOT_TARGET)/bin
#    - header files: $(PTXDIST_SYSROOT_TARGET)/include
#    - libraries: $(PTXDIST_SYSROOT_TARGET)/lib
#
# - $(PTXDIST_SYSROOT_HOST) points to a directory tree all host relevant
#   executables, libraries and header files are installed to. All packages
#   built for the host are searching in this directory tree for executables,
#   header and library files.
#   Paths:
#    - executables: $(PTXDIST_SYSROOT_HOST)/bin
#    - header files: $(PTXDIST_SYSROOT_HOST)/include
#    - libraries: $(PTXDIST_SYSROOT_HOST)/lib
#
# - $(PTXDIST_SYSROOT_CROSS) points to a directory tree all cross relevant
#   executables, libraries and header files are installed to. All packages
#   built for the host to create data for the target are searching in this
#   directory tree for executables, header and library files.
#   Paths:
#    - executables: $(PTXDIST_SYSROOT_CROSS)/bin
#    - header files: $(PTXDIST_SYSROOT_CROSS)/include
#    - libraries: $(PTXDIST_SYSROOT_CROSS)/lib
#
#
# If no compile time files are reqired, skip this stage
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/anyviz.targetinstall:
	@$(call targetinfo)
#
# TODO: To build your own package, if this step requires one
	@$(call install_init, anyviz)
	@$(call install_fixup,anyviz,PRIORITY,optional)
	@$(call install_fixup,anyviz,SECTION,base)
	@$(call install_fixup,anyviz,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,anyviz,DESCRIPTION,missing)
#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
#	@$(call install_copy, anyviz, 0, 0, 0755, $(ANYVIZ_DIR)/foobar, /dev/null)
#
#	@$(call install_finish,anyviz)

#	@$(call install_copy, anyviz, 0, 0, 0755, $(PTXDIST_SYSROOT_TARGET)/bin/$(ANYVIZ), /usr/bin/$(ANYVIZ))
#	@$(call install_copy, anyviz, 0, 0, 0644, \
#		$(PTXDIST_SYSROOT_TARGET)/bin/$(ANYVIZ_SERVICE), /etc/systemd/system/$(ANYVIZ_SERVICE))
#	@$(call install_link, anyviz, /etc/systemd/system/$(ANYVIZ_SERVICE), /etc/systemd/system/multi-user.target.wants/$(ANYVIZ_SERVICE))
#	@$(call install_archive, anyviz, 0, 0, $(ANYVIZ_SOURCE), /)

	@$(call install_copy, anyviz, 0, 0, 0755, $(ANYVIZ_DIR)/anyvizcloudadapter, /usr/bin//anyvizcloudadapter)
	@$(call install_copy, anyviz, 0, 0, 0444, $(ANYVIZ_DIR)/iot_launcher.d/anyviz.json, /config/iot_launcher.d/anyviz.json)

	@$(call install_link, anyviz, ttymxc2, /dev/RS232)
	@$(call install_link, anyviz, ttymxc3, /dev/RS485)
	@$(call install_copy, anyviz, 0, 0, 0755, /config/anyviz)
	@$(call install_link, anyviz, /config/anyviz, /etc/anyviz)
	@$(call install_copy, anyviz, 0, 0, 0755, /var/log/anyviz)

	@$(call install_finish, anyviz)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/anyviz.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ANYVIZ)

# vim: syntax=make
