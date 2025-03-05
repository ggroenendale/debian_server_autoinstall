## Debian Network Server install

---

### Introduction

---

The purpose of this repository is to setup my new Debian network server. This server is both a file storage server and a machine to host Kubernetes containers and a Postgres Database.

Some of the containers are development containers as well as a local network App/Dashboard to be accessed by machines on the local network and to host some cool functions including internet of things type controls.

The way this works is through the included Preseed configuration to configure Debian during the install and then an Ansible Configuration file named `setup.yml` that runs post Debian OS configuration.

Here is the step by step:

### 1) Install Ventoy onto a USB stick

Download Ventoy
> https://www.ventoy.net/en/download.html

```bash
sudo ./Ventoy2Disk.sh -i /dev/sdX # Replace 'sdX with your usb Device'
```

### 2) Copy Debian ISO to the USB Drive

```bash
cp ~/Downloads/debian.iso /mnt/ventoy
```

### 3) Setup Ansible and other scripts on USB stick

Ventoy creates a standard FAT32/ExFAT parition, we can add a foilkder for Ansible and our post-install scripts.

Create ansible folder on USB stick
```bash
mkdir /mnt/ventoy/debian_install
```

Copy the `preseed.cfg`, `postinstall.service`, `setup.sh`, and `playbook.yml` files to the debian_postinstall folder.

```bash
cp preseed.cfg /mnt/ventoy/debian_install
cp postinstall.service /mnt/ventoy/debian_install
cp setup.sh /mnt/ventoy/debian_install
cp playbook.yml /mnt/ventoy/debian_install
```

