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
PACKAGES-$(PTXCONF_ADD_BOOTCHOOSER_OPTIONS) += add_bootchooser_options

ADD_BOOTCHOOSER_OPTIONS_VERSION	:= 0.1.0
ADD_BOOTCHOOSER_OPTIONS_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_bootchooser_options.get:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_bootchooser_options.extract:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_bootchooser_options.prepare:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_bootchooser_options.compile:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_bootchooser_options.install:
#	@$(call targetinfo)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/add_bootchooser_options.targetinstall:
	@$(call targetinfo)

	@$(call install_init, add_bootchooser_options)
	@$(call install_fixup,add_bootchooser_options,PRIORITY,optional)
	@$(call install_fixup,add_bootchooser_options,SECTION,base)
	@$(call install_fixup,add_bootchooser_options,AUTHOR,"Ralf Glaser <glaser@iotmaxx.de>")
	@$(call install_fixup,add_bootchooser_options,DESCRIPTION,missing)
#
# TODO: Add here all files that should be copied to the target
# Note: Add everything before(!) call to macro install_finish
#
#	@$(call install_alternative, add_bootchooser_options, 0, 0, 0644, /etc/foobar)
	echo "all-zero" > configs/platform-iotmaxx-gateway/barebox-defaultenv/nv/bootchooser.reset_attempts

	@$(call install_finish,add_bootchooser_options)

	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/add_bootchooser_options.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, ADD_BOOTCHOOSER_OPTIONS)

# vim: syntax=make
