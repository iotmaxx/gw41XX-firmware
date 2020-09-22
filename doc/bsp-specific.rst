BSP specific information
========================

.. _manual,partial_power_management:

Partial Power Management
------------------------

The voltage ``5V_PERIPH`` supplies the following *GW4100* components:

- CAN transceiver (U1101)
- RS232 transceiver (U1100)
- RS485 transceiver (U1104/U1103)
- I²C driven 1wire bus master (U1102)
- the expansion board connector

Since the ``5V_PERIPH`` power supply is switchable, all these devices can be
powered only at once, never independently. Further more, in order to save
power, the data lines between the i.MX7 SoC and the switched devices need some
preparation to avoid power leakage. This cannot be done for all device at the
same time in a safe manner and thus, the ``5V_PERIPH`` power supply gets
switched on in the bootloader and never switched off again after that.
