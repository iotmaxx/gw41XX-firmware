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
PACKAGES-$(PTXCONF_CUSTOMER_SYSTEMD) += customer_systemd

#
# Paths and names
#
CUSTOMER_SYSTEMD_VERSION	:= 20241028
CUSTOMER_SYSTEMD_MD5		:=
CUSTOMER_SYSTEMD                := customer_systemd-$(CUSTOMER_SYSTEMD_VERSION)
CUSTOMER_SYSTEMD_SRC		:= local_src/$(CUSTOMER_SYSTEMD)
CUSTOMER_SYSTEMD_LICENSE	:= ignore

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------
CUSTOMER_SYSTEMD_CONF_TOOL      := NO
CUSTOMER_SYSTEMD_MAKE_ENV       := $(CROSS_ENV)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/customer_systemd.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/customer_systemd.extract:
#       @$(call targetinfo)
#       @$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/customer_systemd.prepare:
#       @$(call targetinfo)
#       @$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(STATEDIR)/customer_systemd.compile:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/customer_systemd.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/customer_systemd.targetinstall:
	@$(call targetinfo)

	@$(call install_init, customer_systemd)
	@$(call install_fixup, customer_systemd,PRIORITY,optional)
	@$(call install_fixup, customer_systemd,SECTION,base)
	@$(call install_fixup, customer_systemd,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup, customer_systemd,DESCRIPTION,missing)

	@$(call install_copy, customer_systemd, 0, 0, 0644, $(CUSTOMER_SYSTEMD_SRC)/customer_service_prepare.service, /etc/systemd/system/customer_service_prepare.service)
	@$(call install_copy, customer_systemd, 0, 0, 0644, $(CUSTOMER_SYSTEMD_SRC)/customer.target, /etc/systemd/system/customer.target)
	@$(call install_link, customer_systemd, /etc/systemd/system/customer_service_prepare.service, /etc/systemd/system/multi-user.target.wants/customer_service_prepare.service)
	@$(call install_copy, customer_systemd, 0, 0, 0755, /opt/systemd/system/customer.target.wants)
	@$(call install_link, customer_systemd, /opt/systemd/system/, /usr/local/lib/systemd/system)

	@$(call install_finish, customer_systemd)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/customer_systemd.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, CUSTOMER_SYSTEMD)

# vim: syntax=make
