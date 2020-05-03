# qubes-usb3to2-service-dom0
Change USB3.0 devices into USB2.0 at system boot

# Why?
As stated in [Qubes FAQ](https://www.qubes-os.org/faq/), when you get strict reset error starting a domain with usb controllers, even when allowing `no-strict-reset` option to this controllers, maybe you are facing an usb controller which does not support resets.

***Take a further look at their FAQ, in the strict reset [section](https://www.qubes-os.org/faq/#i-created-a-usbvm-and-assigned-usb-controllers-to-it-now-the-usbvm-wont-boot)***

# Installing
- clone the repo in some domU with network access:
```bash
git clone git@github.com:yanmarques/qubes-usb3to2-service-dom0.git
```

- check gpg signature, first one must get the public key:
```bash
$ gpg2 --keyserver keys.gnupg.net --recv-keys 0xB677080945DF2D38C7C5F15F80AB0F5FDECFB4A9
```
as Qubes itself always confirm, [distrust the infrastructure](https://www.qubes-os.org/faq/#what-does-it-mean-to-distrust-the-infrastructure), you may also check the public key from another keyserver, from github [gpg keys api](https://developer.github.com/v3/users/gpg_keys/#list-gpg-keys-for-a-user), etc...

  - verify repo tag, inside cloned directory:
```bash
git tag -v v0.1
```
one should see a `Good signature`, otherwhise go back and repeate above steps or search for help.

- copy the directory to dom0, see [how to do it](https://www.qubes-os.org/doc/copy-from-dom0/#copying-to-dom0)

- in dom0 terminal, inside the directory one copied, type:
```bash
$ sudo make install
```

# Questions
- I use sys-net or whatever as my usb domain, so?
  
  R: Fair enough, go to usb3to2.service and change `qubes-vm@sys-usb.service` to `qubes-vm@WHATEVER-YOU-USE-AS-USB-DOMAIN.service`. If you have already installed it, just install it again and it should overwrite the old version.

- After the screen has been locked, my devices disappears, so?
  
  R: Yes this happens to me too, I have to question this to QubesOS team, or maybe you do it. Anyway the easiest solution is to start usb3to2 service again with a `sudo systemctl start usb3to2`. 
