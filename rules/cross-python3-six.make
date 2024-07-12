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
PACKAGES-$(PTXCONF_CROSS_PYTHON3_SIX) += cross-python3-six

#
# Paths and names
#
CROSS_PYTHON3_SIX_VERSION	:= 1.16.0
CROSS_PYTHON3_SIX_MD5		:= a7c927740e4964dd29b72cebfc1429bb
CROSS_PYTHON3_SIX		:= six-$(CROSS_PYTHON3_SIX_VERSION)
CROSS_PYTHON3_SIX_SUFFIX	:= tar.gz
CROSS_PYTHON3_SIX_URL		:= https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/$(CROSS_PYTHON3_SIX).$(CROSS_PYTHON3_SIX_SUFFIX)
CROSS_PYTHON3_SIX_SOURCE	:= $(SRCDIR)/$(CROSS_PYTHON3_SIX).$(CROSS_PYTHON3_SIX_SUFFIX)
CROSS_PYTHON3_SIX_DIR		:= $(CROSS_BUILDDIR)/$(CROSS_PYTHON3_SIX)
CROSS_PYTHON3_SIX_LICENSE	:= MIT
CROSS_PYTHON3_SIX_LICENSE_FILES	:=

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(CROSS_PYTHON3_SIX_SOURCE):
#	@$(call targetinfo)
#	@$(call get, CROSS_PYTHON3_SIX)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#CROSS_PYTHON3_SIX_CONF_ENV	:= $(CROSS_ENV)

#
# python3
#
CROSS_PYTHON3_SIX_CONF_TOOL	:= python3
#CROSS_PYTHON3_SIX_CONF_OPT	:= 

#$(STATEDIR)/cross-python3-six.prepare:
#	@$(call targetinfo)
#	@$(call world/prepare, CROSS_PYTHON3_SIX)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-python3-six.compile:
	@$(call targetinfo)
	cd $(PTXDIST_PLATFORMDIR)/build-cross/six-1.16.0 && \
	PATH=$(HOST_CROSS_PATH) \
	$(PTXDIST_SYSROOT_CROSS)/bin/python$(PYTHON3_MAJORMINOR) setup.py build

#	PATH=/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-cross/bin:/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-cross/sbin:\
#	/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-host/lib/wrapper:/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-host/bin:\
#	/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-host/sbin:/home/ptx/next_rgl_20210709/gw41XX-firmware/selected_toolchain:/usr/local/lib/ptxdist-2021.06.0/bin:\
#	/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
#	/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-cross/bin/python3.7 setup.py build
#	@$(call world/compile, CROSS_PYTHON3_SIX)
#	python3 setup.py
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/cross-python3-six.install:
	@$(call targetinfo)
	cd $(PTXDIST_PLATFORMDIR)/build-cross/six-1.16.0 && \
	PATH=$(HOST_CROSS_PATH) \
	$(PTXDIST_SYSROOT_CROSS)/bin/python$(PYTHON3_MAJORMINOR) setup.py install

#	cd /home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/build-cross/six-1.16.0 && PATH=/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-cross/bin:/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-cross/sbin:/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-host/lib/wrapper:/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-host/bin:/home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-host/sbin:/home/ptx/next_rgl_20210709/gw41XX-firmware/selected_toolchain:/usr/local/lib/ptxdist-2021.06.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin /home/ptx/next_rgl_20210709/gw41XX-firmware/platform-iotmaxx-gateway/sysroot-cross/bin/python3.7 setup.py install
#	@$(call world/install, CROSS_PYTHON3_SIX)
#	python3 setup.py
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/cross-python3-six.targetinstall:
#	@$(call targetinfo)
#
#	@$(call install_init, cross-python3-six)
#	@$(call install_fixup, cross-python3-six,PRIORITY,optional)
#	@$(call install_fixup, cross-python3-six,SECTION,base)
#	@$(call install_fixup, cross-python3-six,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
#	@$(call install_fixup, cross-python3-six,DESCRIPTION,missing)
#
#	@$(call install_copy, cross-python3-six, 0, 0, 0755, $(CROSS_PYTHON3_SIX_DIR)/foobar, /dev/null)
#
#	@$(call install_finish, cross-python3-six)
#
#	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/cross-python3-six.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, CROSS_PYTHON3_SIX)

# vim: syntax=make
