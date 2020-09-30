Hardware specific information
=============================

Some information for the impatient.

PCB Revision information
------------------------

.. code-block:: text

   |                                                                    |
   |                                                                    |
   |                                                                    |
   |         +----------------------------------------+                 |
   |         | <--- Revision Information              |       top layer |
   +---------+                                        +-----------------+

Gateway Revision 1.05 … 1.07
----------------------------

Power Connector
^^^^^^^^^^^^^^^

.. code-block:: text

      +-------+
      |       |
      |  NET  |  +---+---+
      |       |  | 1 | 2 | <-- Power connector
      |       |  | O | O |
   ---+-------+--+---+---+-+
   ------------------------+

+-----+------------------+
| Pin |      Signal      |
+=====+==================+
|  1  | +12 V…24 V @ 1 A |
+-----+------------------+
|  2  |       GND        |
+-----+------------------+

Network
-------

.. code-block:: text

      +-------+
      |       |
      |  NET  |  +---+---+
      |       |  | v | v |
      |       |  | O | O |
   ---+-------+--+---+---+-+
   ------------------------+

Serial
------

.. _manual,debug_console:

Debug Console
^^^^^^^^^^^^^

.. code-block:: text

                                                     +--+
                  J1305                 J1306        || | <--- USB A
      +---+---+---+---+---+---+   +---+---+---+---+  || |
      | 2 | 4 | 6 | 8 | 10| 12|   | O | O | O | O |  || |
      +---+---+---+---+---+---+   +---+---+---+---+  || |
      | 1 | 3 | 5 | 7 | 9 | 11|   | O | O | O | O |  || |
    --+---+---+---+---+---+---+---+---+---+---+---+--+--+--
    -------------------------------------------------------

Can be found at *J1305*

+-----+--------+---------+-----+-----+
| Pin | Signal |   Dir   | DCE | DTE |
+=====+========+=========+=====+=====+
| 5/6 |   GND  | passive |  5  |  5  |
+-----+--------+---------+-----+-----+
|  9  |   TXD  | output  |  2  |  3  |
+-----+--------+---------+-----+-----+
| 10  |   CTS  |  input  |  7  |  8  |
+-----+--------+---------+-----+-----+
| 11  |   RXD  |  input  |  3  |  2  |
+-----+--------+---------+-----+-----+
| 12  |   RTS  | output  |  8  |  7  |
+-----+--------+---------+-----+-----+

.. hint:: | DCE: Data Communication Equipment, usually a DSUB9 female, device
          | DTE: Data Terminal Equipment, usually a DSUB9 male, host

.. important:: The serial signals are V24 compatible (**no** TTL!)

.. hint:: This is UART#3

.. attention:: In order to use this serial connection, an internal voltage
               switch must be enabled to power the level shifter.

.. _manual,boot_config:

Booting the GW4100
------------------

By default, the *i.MX7* SoC boots via internal fuse configuration. If this fails,
it might fall back to *serial download* via USB OTG.

To force the *i.MX7* SoC to *serial download* via USB OTG the *J1402* can be
modified.

The *J1402* can be found at the PCB's reverse:

.. code-block:: text

                             +----------------------+
                             |                      |
                             |                      |
      -----------------------+                      |
                     1   2                          |
                      O O <--- GND                  |
                      O O                           |

By shorten pins 1-2, the *i.MX7* bootmode is set to *serial download*.

.. attention:: To shorten the pins, an 1.28 mm jumper is required.

.. hint:: A 2 mm jumper does the work as well

Misc Hardware Information
-------------------------

SoC's UART usage
^^^^^^^^^^^^^^^^

UART#1
''''''

TODO

UART#2
''''''

Can be found at J1300:

.. code-block:: text

   |       4 4                                                          |
   |       3 1                                     3 1                  |
   |       O O O O O O O O O O O O O O O O O O O O O O                  |
   |       O O O O O O O O O O O O O O O O O O O O O O                  |
   |       4 4                                     4 2                  |
   |       4 2                                                          |
   |                                                                    |
   |         +----------------------------------------+                 |
   |         |                                        |       top layer |
   +---------+                                        +-----------------+

+-----+--------+---------+
| Pin | Signal |   Dir   |
+=====+========+=========+
| 37  |   CTS  |  input  |
+-----+--------+---------+
| 38  |   RTS  | output  |
+-----+--------+---------+
| 39  |   TXD  | output  |
+-----+--------+---------+
| 40  |   RXD  |  input  |
+-----+--------+---------+
| 41  |   GND  | passive |
+-----+--------+---------+

.. important:: The serial signals are at 3.3 V TTL levels

UART#3
''''''

Debug console at *J1305*. Refer :ref:`manual,debug_console`.

UART#4
''''''

Used for RS485 connections. Refer :ref:`manual,rs485`.

UART#5
''''''

TODO

UART#6
''''''

Used for the GSM modem connection. Refer :ref:`manual,gsm_modem`.

UART#7
''''''

Can be found at J500:

.. code-block:: text

   |                                          +-----+                   |
   |                                          | J500|                   |
   |                                          +-----+                   |
   |         +----------------------------------------+                 |
   |         |                              TODO Pin1 |       top layer |
   +---------+                                        +-----------------+

+-----+--------+---------+
| Pin | Signal |   Dir   |
+=====+========+=========+
|  1  |  RxD   |  input  |
+-----+--------+---------+
|  2  |  TxD   | output  |
+-----+--------+---------+
|  3  |  GND   | passive |
+-----+--------+---------+

.. important:: The serial signals are at 3.3 V TTL levels

.. _manual,gsm_modem:

Modem
-----

Two variants are available:

 - Quectel EC21-E (default type)
 - Fibocomm Wireless Inc, L610 (PCB version 1.07) (just for tests)

Connections to the modem
^^^^^^^^^^^^^^^^^^^^^^^^

UART
''''

Used serial unit: UART6

+--------+---------+---------+
| Signal |   Dir   |  Notes  |
+========+=========+=========+
|  RxD   |  input  | DCE/RX  |
+--------+---------+---------+
|  TxD   | output  | DCE/TX  |
+--------+---------+---------+
|  CTS   |  input  | DCE/CTS |
+--------+---------+---------+
|  RTS   |  output | DCE/RTS |
+--------+---------+---------+
|  RI    |  input  | GPIO5/4 |
+--------+---------+---------+

*Dir* is meant at the *SoC*, e.g. the *SoC's* UART is connected in *DCE* style.

USB
'''

Connected via USB HUB. Refer :ref:`manual,usb-host`.

CAN Bus
-------

.. code-block:: text

                                                     +--+
                  J1305                 J1306        || | <--- USB A
      +---+---+---+---+---+---+   +---+---+---+---+  || |
      | 2 | 4 | 6 | 8 | 10| 12|   | O | O | O | O |  || |
      +---+---+---+---+---+---+   +---+---+---+---+  || |
      | 1 | 3 | 5 | 7 | 9 | 11|   | O | O | O | O |  || |
    --+---+---+---+---+---+---+---+---+---+---+---+--+--+--
    -------------------------------------------------------

Can be found at *J1305*

+-----+--------+
| Pin | Signal |
+=====+========+
|  3  |  CANH  |
+-----+--------+
|  4  |  CANL  |
+-----+--------+
| 5/6 |  GND   |
+-----+--------+

.. attention:: In order to use this CAN connection, an internal voltage
               switch must be enabled to power the level shifter.

.. _manual,rs485:

RS485
-----

.. code-block:: text

                                                     +--+
                  J1305                 J1306        || | <--- USB A
      +---+---+---+---+---+---+   +---+---+---+---+  || |
      | 2 | 4 | 6 | 8 | 10| 12|   | O | O | O | O |  || |
      +---+---+---+---+---+---+   +---+---+---+---+  || |
      | 1 | 3 | 5 | 7 | 9 | 11|   | O | O | O | O |  || |
    --+---+---+---+---+---+---+---+---+---+---+---+--+--+--
    -------------------------------------------------------

Can be found at *J1305*

+-----+--------+
| Pin | Signal |
+=====+========+
| 5/6 |  GND   |
+-----+--------+
|  7  |   B    |
+-----+--------+
|  8  |   A    |
+-----+--------+

.. attention:: In order to use this serial connection, an internal voltage
               switch must be enabled to power the signal transmitter.

1Wire
-----

.. code-block:: text

                                                     +--+
                  J1305                 J1306        || | <--- USB A
      +---+---+---+---+---+---+   +---+---+---+---+  || |
      | 2 | 4 | 6 | 8 | 10| 12|   | O | O | O | O |  || |
      +---+---+---+---+---+---+   +---+---+---+---+  || |
      | 1 | 3 | 5 | 7 | 9 | 11|   | O | O | O | O |  || |
    --+---+---+---+---+---+---+---+---+---+---+---+--+--+--
    -------------------------------------------------------

Can be found at *J1305*

+-----+--------+
| Pin | Signal |
+=====+========+
|  1  |  DATA  |
+-----+--------+
|  2  |  VCC   |
+-----+--------+
| 5/6 |  GND   |
+-----+--------+

.. attention:: In order to use this connection, an internal voltage
               switch must be enabled to power the 1Wire master device.

USB Map
-------

OTG1
^^^^

TODO

OTG2
^^^^

TODO

.. _manual,usb-host:

HOST
^^^^

.. code-block:: text

    +------------+
    |            |
    | i.MX7  SoC |----- OTG1 ----------------------> TODO
    |            |----- OTG2 ----------------------> TODO
    +------------+
      |   |
      |   |             +-------------+
      |   |             | USB HUB     |
      |   +--- HOST --->|           p1|----------------> GSM Modem
      |                 |             |
      +-- TODO -------<>|I²C        p2|----------------> USB#0 (expansion)
      |                 |___          |
      +-- TODO---------<|INT        p3|----------------> USB#1 (expansion)
      |                 |___       OC#|<---------------- USB#1 OverCurrent
      +-- GPIO3/13 ---->|RES       PWR|----------------> USB#1 Port Power
                        |             |
                        +-------------+

Expansion Board Connector
-------------------------

J1300

.. code-block:: text

   |       4 4                                                          |
   |       3 1                                     3 1                  |
   |       O O O O O O O O O O O O O O O O O O O O O O                  |
   |       O O O O O O O O O O O O O O O O O O O O O O                  |
   |       4 4                                     4 2                  |
   |       4 2                                                          |
   |                                                                    |
   |         +----------------------------------------+                 |
   |         |                                        |       top layer |
   +---------+                                        +-----------------+

Various signals at the expansion board connector are at safe and passive
levels by default and can be changed to active/different use at run-time.

+-----+--------------+--------+-------+----------------------------------+
| Pin |    Signal    |  Dir   | Level | Note                             |
+=====+==============+========+=======+==================================+
|  1  |  PCM CLK     |  out   | 1.8 V | SoC/modem                        |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in @SoC (default)           |
+-----+--------------+--------+-------+----------------------------------+
|  2  |  PCM DIN     |   in   | 1.8 V | SoC/modem                        |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in @SoC (default)           |
+-----+--------------+--------+-------+----------------------------------+
|  3  |  PCM SYNC    |  out   | 1.8 V | SoC/modem                        |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in @SoC (default)           |
+-----+--------------+--------+-------+----------------------------------+
|  4  |  PCM DOUT    |  out   | 1.8 V | SoC/modem                        |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in @SoC (default)           |
+-----+--------------+--------+-------+----------------------------------+
|  5  |  USB#1 OC#   |   in   | 3.3 V | to USB HUB                       |
+-----+--------------+--------+-------+----------------------------------+
|  6  |  USB#1 PWR   |  out   | 3.3 V | from USB HUB                     |
+-----+--------------+--------+-------+----------------------------------+
|  7  | USB#0 data - |   bi   |  var  | USB signal 'DN'                  |
+-----+--------------+--------+-------+----------------------------------+
|  8  | USB#1 data - |   bi   |  var  | USB signal 'DN'                  |
+-----+--------------+--------+-------+----------------------------------+
|  9  | USB#0 data + |   bi   |  var  | USB signal 'DP'                  |
+-----+--------------+--------+-------+----------------------------------+
| 10  | USB#1 data + |   bi   |  var  | USB signal 'DP'                  |
+-----+--------------+--------+-------+----------------------------------+
| 11  | SPI MOSI     |  out   | 3.3 V | SPI data SoC to device           |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 12  | SPI CS       |  out   | 3.3 V | SPI select SoC to device         |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 13  | SPI MISO     |   in   | 3.3 V | SPI data device to SoC           |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 14  | SPI CLK      |  out   | 3.3 V | SPI clock SoC to device          |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 15  | SAI TXD      |  out   | 3.3 V |                                  |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 16  | SAI MCLK     |  out   | 3.3 V |                                  |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 17  | SAI TXF      |  out   | 3.3 V |                                  |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 18  | SAI TXC      |  out   | 3.3 V |                                  |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 19  | SAI RXC      |   in   | 3.3 V |                                  |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 20  | SAI RXF      |   in   | 3.3 V |                                  |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 21  | SAI RXD      |   in   | 3.3 V |                                  |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 22  | GND          | passiv |   0 V | Signal ground                    |
+-----+--------------+--------+-------+----------------------------------+
| 23  | IO0          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 24  | IO5          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 25  | IO10         |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 26  | IO3          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 27  | IO6          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 28  | IO4          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 29  | IO2          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 30  | IO7          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 31  | IO8          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 32  | IO1          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 33  | I²C CLK      |   in   | 3.3 V | GPIO, 4.7 k Ohm PullUp (default) |
+-----+--------------+--------+-------+----------------------------------+
| 34  | I²C DAT      |   in   | 3.3 V | GPIO, 4.7 k Ohm PullUp (default) |
+-----+--------------+--------+-------+----------------------------------+
| 35  | GND          | passiv |   0 V | Signal ground                    |
+-----+--------------+--------+-------+----------------------------------+
| 36  | IO9          |   in   | 3.3 V | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 37  | UART CTS     |   in   | 3.3 V | from DCE unit                    |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 38  | UART RTS     |  out   | 3.3 V | to DCE unit                      |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 39  | UART TXD     |  out   | 3.3 V | to DCE unit                      |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 40  | UART RXD     |   in   | 3.3 V | from DCE unit                    |
+-----+--------------+--------+-------+----------------------------------+
|                    |   in   |       | GPIO in, PU enabled (default)    |
+-----+--------------+--------+-------+----------------------------------+
| 41  | GND          | passiv |   0 V | Signal ground                    |
+-----+--------------+--------+-------+----------------------------------+
| 42  | Main supply  |  out   |  24 V | Main input supply                |
+-----+--------------+--------+-------+----------------------------------+
| 43  | int. supply  |  out   | 3.3 V | Internal device supply           |
+-----+--------------+--------+-------+----------------------------------+
| 44  | int. supply  |  out   | 5.0 V | SoC controlled supply            |
+-----+--------------+--------+-------+----------------------------------+

- *PU*: weak PullUp to *level* voltage (47 k Ohm … 100 k Ohm, firmware controlled)
- *in*: Input at the *SoC*
- *out*: Output at the *SoC*
- *bi*: bi-directional option at the *SoC*. This depends on the enabled function
- *var*: level depends on the speed (low, full, high)

.. hint:: All GPIO signals have interrupt capabilities.

.. note:: The I²C signals at the connector are always active in order to detect
          an EEPROM device part of an attached expansion board

.. important:: The expected EEPROM on the attached expansion board is of
               type *26C64* at I²C address *0x50*.
