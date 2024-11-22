#!/bin/sh

mkdir -p local_src/licenses
ptxdist list-packages | xargs ptxdist package-info | grep -e package: -e version: -e license: | awk '{ if ($1 == "package:") print ""; else printf ","; $1=""; printf $0}' > local_src/licenses/linux_licenses.csv

