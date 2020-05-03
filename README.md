# qubes-usb3to2-service-dom0
Change USB3.0 devices into USB2.0 at system boot

# Why?
As stated in [Qubes FAQ](https://www.qubes-os.org/faq/), when you get strict reset error starting a domain with usb controllers, even when allowing `no-strict-reset` option to this controllers, maybe you are facing an usb controller which does not support resets.

***Take a further look at their FAQ, in the strict reset [section](https://www.qubes-os.org/faq/#i-created-a-usbvm-and-assigned-usb-controllers-to-it-now-the-usbvm-wont-boot)***

# Installing
- download it [here](https://github.com/yanmarques/qubes-usb3to2-service-dom0/archive/master.zip)

- extract it:
```bash
$ unzip master.zip
```

- copy `qubes-usb3to2-service-dom0-master` directory to dom0, see [how to do it](https://www.qubes-os.org/doc/copy-from-dom0/#copying-to-dom0)

- in dom0 terminal, inside `qubes-usb3to2-service-dom0` type:
```bash
$ sudo make install
```

# Questions
- I use sys-net or whatever as my usb domain, so?
  
  R: Fair enough, go to usb3to2.service and change `qubes-vm@sys-usb.service` to `qubes-vm@WHATEVER-YOU-USE-AS-USB-DOMAIN.service`. If you have already installed it, just install it again and it should overwrite the old version.

- After the screen has been locked, my devices disappears, so?
  
  R: Yes this happens to me too, I have to question this to QubesOS team, or maybe you do it. Anyway the easiest solution is to start usb3to2 service again with a `sudo systemctl start usb3to2`. 
