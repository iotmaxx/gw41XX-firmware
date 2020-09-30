Bootstrap
=========

If the *GW4100* doesn't boot or is unflashed yet, you can force the
*i.MX7 serial download* mode to bring back life into the system via USB.
Refer :ref:`manual,boot_config` how to configure *J1402* in order to force this
special mode.

.. note:: If the *GW4100* is unflashed yet, it may fall back to serial download
          by default and no configuration change at *J1402* is required.

By connecting the *GW4100* as a device via *J1400* to the development host, a
new bootloader can be downloaded.

When the *GW4100* gets powered, the development host should recognize an new
USB device.

.. code-block:: text

   usb 1-12.5.5: new high-speed USB device number 17 using xhci_hcd
   usb 1-12.5.5: New USB device found, idVendor=15a2, idProduct=0076, bcdDevice= 0.01
   usb 1-12.5.5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
   usb 1-12.5.5: Product: SE Blank ULT1
   usb 1-12.5.5: Manufacturer: Freescale SemiConductor Inc
   hid-generic 0003:15A2:0076.000A: hiddev4,hidraw6: USB HID v1.10 Device [Freescale SemiConductor Inc  SE Blank ULT1] on usb-0000:00:14.0-12.5.5/input

Start the bootloader with::

  platform-iotmaxx-gateway/build-target/barebox-2020.07.0-build/scripts/imx/imx-usb-loader platform-iotmaxx-gateway/images/barebox-iotmaxx-imx7d-gw4100.img

.. note:: The correct path to the ``imx-usb-loader`` tool may vary due to
          bootloader version updates

.. warning:: As of September 2020 the warmstart feature on the *GW4100* is still
             not working. After the watchdog has triggered a reset, the *GW4100*
             needs a cold start to get it work again

Then the bootloader can be flashed to the eMMC via network with::

  barebox@IoTMAXX i.MX7D Gateway:/ barebox_update /mnt/tftp/barebox-iotmaxx-imx7d-gateway.img

.. note:: This step requires full network setup and a working *TFTP* service in
          your network. The :ref:`manual,fastboot_feature` feature can be used
          as an alternative.

barebox does atomic updates of the two available eMMC *boot* hardware partitions.
That means, that barebox_update will always flash the new barebox to the *boot*
partition that is not currently booted and then update the mmc2.boot variable.

To check the activated boot partition::

  barebox@IoTMAXX i.MX7D Gateway:/ devinfo mmc2
  Host information:
    current clock: 52000000
    current buswidth: 8
    capabilities: 4bit 8bit sd-hs mmc-hs
  Card information:
    Attached is a MMC card
    Version: 5.1
    Capacity: 7456 MiB
    High capacity card
     CID: 11010030-30384742-3004348F-C3EEA600
     CSD: D0270032-8F5903FF-FFFFFFE7-86400000
    Max. transfer speed: 52000000 Hz
    capabilities: 4bit mmc-hs mmc-52MHz
    Manufacturer ID: 11
    OEM/Application ID: 0100
    Product name: '008GB'
    Product revision: 3.0
    Serial no: 881837038
    Manufacturing date: 10.2019
  Parameters:
    boot: boot0 (type: enum) (values: "disabled", "boot0", "boot1", "user")
    probe: 0 (type: bool)

Or just::

  barebox@IoTMAXX i.MX7D Gateway:/ echo $mmc2.boot
  boot0

After the update barebox will boot from the other boot partition.

eMMC BKOPS
^^^^^^^^^^

To optimize write performance enable BKOPS in the eMMC with::

  mmc_extcsd -b /dev/mmc2

.. important:: This operation is NOT reversible! Linux supports this feature
  since v3.7.

.. _manual,fastboot_feature:

Fastboot
^^^^^^^^

.. hint:: The mentioned tool here is from the package *fastboot* and needs to
          be installed first.

To copy the image to the eMMC via fastboot and optionally update barebox,
first export the mmc2 via fastboot::

  barebox@IoTMAXX i.MX7D Gateway:/ usbgadget -A -b

Then on the host PC::

  fastboot flash root platform-iotmaxx-gateway/images/gateway.hdimg

To update barebox::

  fastboot flash bbu-emmc platform-iotmaxx-gateway/images/barebox-iotmaxx-imx7d-gateway.img

.. attention:: As of September 2020 *fastboot* clobbers the image file due to its
               size while storing it to the eMMC. Use this feature only if a fix
               is available

Now reset the board.

Boot from eMMC
^^^^^^^^^^^^^^

To fuse the system to boot from eMMC a small script is added to barebox. Just
issue::

  barebox@IoTMAXX i.MX7D Gateway:/ fuse-boot-emmc

Root Password
=============

The root password is set to ``iotmaxx``.
