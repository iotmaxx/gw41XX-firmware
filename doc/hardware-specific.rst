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

TODO

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
TODO
