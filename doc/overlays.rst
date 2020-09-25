Overlays
========

Barebox can load and apply devicetree overlays that are found in /boot on the
rootfs.
To add overlays just put them in ``local_src/expansion-boards/`` and add them
to ``rules/expansion-boards.{in,make}``.

To apply them in barebox issue::

  barebox@IoTMAXX i.MX7D Gateway:/ overlay_map.sh

If an EEPROM is found (for testing purposes ``/dev/eeprom0`` is used, this is
on the baseboard !!!) the first 16 bytes are read out and used as an identifier
for the devicetree that is to be loaded.
E.g. if the first 16 bytes are "test", the script searches for a file
``/mnt/mmc2.4/boot/test.dto`` and applies it to the devicetree that is handed
to the kernel.
