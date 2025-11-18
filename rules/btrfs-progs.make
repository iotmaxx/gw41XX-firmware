# -*-makefile-*-
#
# Copyright (C) 2025 by Ralf Glaser <glaser@iotmaxx.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_BTRFS_PROGS) += btrfs-progs

#
# Paths and names
#
BTRFS_PROGS_VERSION	:= 6.17
BTRFS_PROGS_MD5		:= a31460fb1542a4f8841711999009a73c
BTRFS_PROGS		:= btrfs-progs-$(BTRFS_PROGS_VERSION)
BTRFS_PROGS_SUFFIX	:= tar.gz
BTRFS_PROGS_URL		:= https://github.com/kdave/btrfs-progs/archive/refs/tags/v$(BTRFS_PROGS_VERSION).$(BTRFS_PROGS_SUFFIX)
BTRFS_PROGS_SOURCE	:= $(SRCDIR)/$(BTRFS_PROGS).$(BTRFS_PROGS_SUFFIX)
BTRFS_PROGS_DIR		:= $(BUILDDIR)/$(BTRFS_PROGS)
BTRFS_PROGS_LICENSE	:= GPL-2.0-only AND LGPL-2.1-or-later
BTRFS_PROGS_LICENSE_FILES := 	file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067 \
				file://libbtrfsutil/COPYING;md5=4fbd65380cdd255951079008b364516c

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(BTRFS_PROGS_SOURCE):
#	@$(call targetinfo)
#	@$(call get, BTRFS_PROGS)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

BTRFS_PROGS_CONF_ENV	:= $(CROSS_ENV) \
	ac_cv_path_PYTHON=$(CROSS_PYTHON3)

#
# autoconf
#
BTRFS_PROGS_CONF_TOOL	:= autoconf
BTRFS_PROGS_CONF_OPT	:=  \
	$(CROSS_AUTOCONF_USR) \
	--disable-backtrace \
	--disable-convert \
	--disable-static \
	--disable-documentation \
#	--disable-python 

$(STATEDIR)/btrfs-progs.prepare:
	@$(call targetinfo)
	@$(call world/execute, BTRFS_PROGS, ./autogen.sh)
	@$(call world/prepare, BTRFS_PROGS)
	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/btrfs-progs.compile:
	@$(call targetinfo)
	@$(call world/compile, BTRFS_PROGS)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/btrfs-progs.install:
#	@$(call targetinfo)
#	@$(call world/install, BTRFS_PROGS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/btrfs-progs.targetinstall:
	@$(call targetinfo)

	@$(call install_init, btrfs-progs)
	@$(call install_fixup, btrfs-progs,PRIORITY,optional)
	@$(call install_fixup, btrfs-progs,SECTION,base)
	@$(call install_fixup, btrfs-progs,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, btrfs-progs,DESCRIPTION,missing)

	@$(call install_lib, btrfs-progs, 0, 0, 0644, libbtrfs)
	@$(call install_lib, btrfs-progs, 0, 0, 0644, libbtrfsutil)

	@$(call install_copy, btrfs-progs, 0, 0, 0755, -, /usr/bin/btrfs)
	@$(call install_copy, btrfs-progs, 0, 0, 0755, -, /usr/bin/btrfs-find-root)
	@$(call install_copy, btrfs-progs, 0, 0, 0755, -, /usr/bin/btrfs-image)
	@$(call install_copy, btrfs-progs, 0, 0, 0755, -, /usr/bin/btrfs-map-logical)
	@$(call install_copy, btrfs-progs, 0, 0, 0755, -, /usr/bin/btrfs-select-super)
	@$(call install_copy, btrfs-progs, 0, 0, 0755, -, /usr/bin/btrfstune)
	@$(call install_copy, btrfs-progs, 0, 0, 0755, -, /usr/bin/fsck.btrfs)
	@$(call install_copy, btrfs-progs, 0, 0, 0755, -, /usr/bin/mkfs.btrfs)
	@$(call install_link, btrfs-progs, btrfs, /usr/bin/btrfsck)

	@$(call install_finish, btrfs-progs)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/btrfs-progs.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, BTRFS_PROGS)

# vim: ft=make
