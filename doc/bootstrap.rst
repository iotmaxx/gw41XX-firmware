Bootstrap
=========

When the eMMC is unflashed the board falls back to serial boot mode.
Start barebox with::

  platform-iotmaxx-gateway/build-target/barebox-2020.04.0/scripts/imx/imx-usb-loader platform-iotmaxx-gateway/images/barebox-iotmaxx-imx7d-gateway.img

Then the bootloader can be flashed to the eMMC via network with::

  barebox@IoTMAXX i.MX7D Gateway:/ barebox_update /mnt/tftp/barebox-iotmaxx-imx7d-gateway.img

barebox does atomic updates.
That means, that barebox_update will always flash the new barebox to the boot
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

Fastboot
^^^^^^^^

To copy the image to the eMMC via fastboot and optionally update barebox,
first export the mmc2 via fastboot::

  barebox@IoTMAXX i.MX7D Gateway:/ usbgadget -A -b

Then on the host PC::

  fastboot flash root platform-iotmaxx-gateway/images/gateway.hdimg

To update barebox::

  fastboot flash bbu-emmc platform-iotmaxx-gateway/images/barebox-iotmaxx-imx7d-gateway.img

Now reset the board.

Boot from eMMC
^^^^^^^^^^^^^^

To fuse the system to boot from eMMC a small script is added to barebox. Just
issue::

  barebox@IoTMAXX i.MX7D Gateway:/ fuse-boot-emmc

Root password
=============

The root password is set to ``iotmaxx``.
