# -*-makefile-*-
#
# Copyright (C) 2005 by Robert Schwebel
#               2010 by Marc Kleine-Budde <mkl@pengutronix.de>
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_LIBXSLT) += libxslt

#
# Paths and names
#
LIBXSLT_VERSION	:= 1.1.34
LIBXSLT_MD5	:= db8765c8d076f1b6caafd9f2542a304a
LIBXSLT		:= libxslt-$(LIBXSLT_VERSION)
LIBXSLT_SUFFIX	:= tar.gz
LIBXSLT_SOURCE	:= $(SRCDIR)/$(LIBXSLT).$(LIBXSLT_SUFFIX)
LIBXSLT_DIR	:= $(BUILDDIR)/$(LIBXSLT)
LIBXSLT_LICENSE	:= MIT

LIBXSLT_URL	:= \
	ftp://xmlsoft.org/libxslt/$(LIBXSLT).$(LIBXSLT_SUFFIX) \
	ftp://xmlsoft.org/libxslt/old/$(LIBXSLT).$(LIBXSLT_SUFFIX)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

LIBXSLT_ENV	:= \
	$(CROSS_ENV) \
	ac_cv_path_XML_CONFIG=xml2-config

#
# autoconf
#
LIBXSLT_AUTOCONF := \
	 $(CROSS_AUTOCONF_USR) \
	--disable-static \
	--without-python \
	--$(call ptx/wwo, PTXCONF_LIBXSLT_CRYPTO)-crypto \
	--$(call ptx/wwo, PTXCONF_LIBXSLT_DEBUG)-debug \
	--$(call ptx/wwo, PTXCONF_LIBXSLT_DEBUG)-mem-debug \
	--$(call ptx/wwo, PTXCONF_LIBXSLT_DEBUG)-debugger \
	--with-profiler \
	--$(call ptx/wwo, PTXCONF_LIBXSLT_PLUGINS)-plugins

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/libxslt.targetinstall:
	@$(call targetinfo)

	@$(call install_init, libxslt)
	@$(call install_fixup, libxslt,PRIORITY,optional)
	@$(call install_fixup, libxslt,SECTION,base)
	@$(call install_fixup, libxslt,AUTHOR,"Robert Schwebel <r.schwebel@pengutronix.de>")
	@$(call install_fixup, libxslt,DESCRIPTION,missing)

ifdef PTXCONF_LIBXSLT_LIBXSLT
	@$(call install_lib, libxslt, 0, 0, 0644, libxslt)
endif
ifdef PTXCONF_LIBXSLT_LIBEXSLT
	@$(call install_lib, libxslt, 0, 0, 0644, libexslt)
endif
ifdef PTXCONF_LIBXSLT_XSLTPROC
	@$(call install_copy, libxslt, 0, 0, 0755, -, /usr/bin/xsltproc)
endif
	@$(call install_finish, libxslt)

	@$(call touch)

# vim: syntax=make
