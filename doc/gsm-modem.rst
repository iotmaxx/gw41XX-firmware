GSM Modem
=========

For testing purposes a small script sim_setup.sh is included in
``projectroot/usr/bin``.
This sets the GPIOs for SIM-card 2 usage.

The modem can then be used with::

  root@Gateway:~ mmcli -m 1
  --------------------------------
  General  |            dbus path: /org/freedesktop/ModemManager1/Modem/1
           |            device id: dd1983f3c13bd25a19647d2fca076dad57ef5c57
  --------------------------------
  Hardware |         manufacturer: Quectel
           |                model: EC21
           |    firmware revision: EC21EFAR06A02M4G
           |            supported: gsm-umts, lte
           |              current: gsm-umts, lte
           |         equipment id: 867962042149685
  --------------------------------
  System   |               device: /sys/devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1/usb1/1-1/1-1.1
           |              drivers: option1
           |               plugin: Quectel
           |         primary port: ttyUSB2
           |                ports: ttyUSB0 (qcdm), ttyUSB2 (at), ttyUSB3 (at)
  --------------------------------
  Numbers  |                  own: +4915140075573
  --------------------------------
  Status   |       unlock retries: sim-pin (3), sim-puk (10), sim-pin2 (3), sim-puk2 (10)
           |                state: disabled
           |          power state: on
           |       signal quality: 0% (cached)
  --------------------------------
  Modes    |            supported: allowed: 2g, 3g, 4g; preferred: none
           |              current: allowed: 2g, 3g, 4g; preferred: none
  --------------------------------
  IP       |            supported: ipv4, ipv6, ipv4v6
  --------------------------------
  3GPP     |                 imei: 867962042149685
  --------------------------------
  3GPP EPS | ue mode of operation: csps-2
  --------------------------------
  SIM      |            dbus path: /org/freedesktop/ModemManager1/SIM/0

After every reset the modem increases its number.

ModemManager
^^^^^^^^^^^^

To add a new connection issue::

  root@Gateway:~ nmcli c add type gsm ifname "*" con-name telekom apn "internet.t-mobile"
  Connection 'telekom' (17bdada4-4361-4eca-8506-f6eab6b26a48) successfully added.

And then to enable the connection::

  root@Gateway:~ nmcli c up telekom
  Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/3)

  root@Gateway:~ mmcli -m 1
  --------------------------------
  General  |            dbus path: /org/freedesktop/ModemManager1/Modem/1
           |            device id: 794eb538900f787165b66d8af66496a4e7cd0c8b
  --------------------------------
  Hardware |         manufacturer: QUALCOMM INCORPORATED
           |                model: QUECTEL Mobile Broadband Module
           |    firmware revision: EC21EFAR06A02M4G
           |       carrier config: default
           |         h/w revision: 10000
           |            supported: gsm-umts, lte
           |              current: gsm-umts, lte
           |         equipment id: 867962042149685
  --------------------------------
  System   |               device: /sys/devices/platform/soc/30800000.bus/30b30000.usb/ci_hdrc.1/usb1/1-1/1-1.1
           |              drivers: qmi_wwan, option1
           |               plugin: Quectel
           |         primary port: cdc-wdm0
           |                ports: cdc-wdm0 (qmi), ttyUSB0 (qcdm), ttyUSB2 (at), wwan0 (net),
           |                       ttyUSB3 (at)
  --------------------------------
  Numbers  |                  own: 4915140075573
  --------------------------------
  Status   |                 lock: sim-pin2
           |       unlock retries: sim-pin (3), sim-puk (10), sim-pin2 (3), sim-puk2 (10)
           |                state: connected
           |          power state: on
           |          access tech: gsm
           |       signal quality: 41% (recent)
  --------------------------------
  Modes    |            supported: allowed: 2g; preferred: none
           |                       allowed: 3g; preferred: none
           |                       allowed: 4g; preferred: none
           |                       allowed: 2g, 3g; preferred: 3g
           |                       allowed: 2g, 3g; preferred: 2g
           |                       allowed: 2g, 4g; preferred: 4g
           |                       allowed: 2g, 4g; preferred: 2g
           |                       allowed: 3g, 4g; preferred: 3g
           |                       allowed: 3g, 4g; preferred: 4g
           |                       allowed: 2g, 3g, 4g; preferred: 4g
           |                       allowed: 2g, 3g, 4g; preferred: 3g
           |                       allowed: 2g, 3g, 4g; preferred: 2g
           |              current: allowed: 2g, 3g, 4g; preferred: 4g
  --------------------------------
  Bands    |            supported: egsm, dcs, utran-1, utran-5, utran-8, eutran-1, eutran-3,
           |                       eutran-5, eutran-7, eutran-8, eutran-20
           |              current: egsm, dcs, utran-1, utran-5, utran-8, eutran-1, eutran-3,
           |                       eutran-5, eutran-7, eutran-8, eutran-20
  --------------------------------
  IP       |            supported: ipv4, ipv6, ipv4v6
  --------------------------------
  3GPP     |                 imei: 867962042149685
           |          operator id: 26201
           |         registration: home
  --------------------------------
  3GPP EPS | ue mode of operation: csps-2
  --------------------------------
  SIM      |            dbus path: /org/freedesktop/ModemManager1/SIM/0
  --------------------------------
  Bearer   |            dbus path: /org/freedesktop/ModemManager1/Bearer/0
<<<<<<< HEAD:README


Overlays
========

Barebox can load and apply devicetree overlays that are found in /boot on the rootfs.
To add overlays just put them in local-src/expansion-boards/ and add them to
rules/expansion-boards.{in,make}.

To apply them in barebox issue 

  barebox@IoTMAXX i.MX7D Gateway:/ overlay_map.sh

If an EEPROM is found (for testing purposes /dev/eeprom0 is used, this is on the baseboard !!!)
the first 16 bytes are read out and used as an identifier for the devicetree that is to be loaded.
E.g. if the first 16 bytes are "test", the script searches for a file /mnt/mmc2.4/boot/test.dto and
applies it to the devicetree that is handed to the kernel.
