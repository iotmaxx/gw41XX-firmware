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

.. _manual,emmc_partitioning:

eMMC Partitioning
-----------------

+-----------+------+-------+-----------------------------------------------+
| Partition |  FS  |  Size |  Usage                                        |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p1 | none |  1 M  | 'state' storage                               |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p2 | none | 16 M  | HAB boot source #1 (option)                   |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p3 | none | 16 M  | HAB boot source #2 (option)                   |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p4 | ext4 |  1 G  | Root Filesystem #A                            |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p5 | ext4 |  1 G  | Root Filesystem #B                            |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p6 | ext4 | 128 M | Configuration storage                         |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p7 | ext4 |  1 G  | Data #1                                       |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p8 | ext4 |  2 G  | Data #2                                       |
+-----------+------+-------+-----------------------------------------------+
| mmcblk1p9 | ext4 |  32 M | Factory Default                               |
+-----------+------+-------+-----------------------------------------------+

.. hint:: If the partitions are not working at run-time, compare the image size
          against the eMMC size. Strange things happen, if the image is larger
          than the available eMMC capacity

.. warning:: As of September 2020 the bootloader's *fastboot* feature seems
             broken regarding images larger than 2 GiB and/or 4 GiB. In order
             to prepare the eMMC successfully a different transfer method must
             be used, to bring the image into the device.

CPU Core Control
----------------

In order to enable the second CPU core of the *i.MX7D* SoC, the so called
*Power State Coordination Interface* (aka *PSCI*) is used. This requires the
Linux kernel to be started in the *nonsecure mode*. The *PSCI* feature itself
is provided by the bootloader and the Linux kernel depends on it. Else the
*GW4100* runs with a single CPU core only.

.. warning:: As of October 2020 the bootloader's *PSCI* feature is incomplete
             and the Linux kernel's PSCI based *CPU IDLE* driver crashes. This
             driver must not be used as long as the bootloader's *PSCI* feature
             is incomplete
.. warning:: As of October 2020 the Linux kernel's *PSCI checker* should not
             be used
