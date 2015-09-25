# Programming Contest LiveCD Builder
This repository contains Vagrant configuration to allow unnattended LiveCD / LiveUSB ISO building using [Yuki's Ubuntu Construction Kit setup](https://github.com/N-Yuki/sppc-ubuntu-customisation) on any OS supported by [Vagrant](https://www.vagrantup.com) (e.g., Linux, MacOS, Windows).
## One-off setup
- Install [Vagrant](https://www.vagrantup.com) from https://www.vagrantup.com

## Usage
1. `git clone` this repository (in a shell session)
2. Tweak `./on-VM/uck-customization-scripts/customize` for your site's needs, e.g. timezone, firewalling, etc.
  - If untweaked, a default setup will be built - fine for testing, and thanks to Yuki.
3. Within your clone of the repository run `vagrant up`
4. Burn / run in a VM / etc. the `./cache/livecd.iso` file produced.

## Clean up
- Vagrant will leave a VM running after the ISO is built.
- In your git clone's directory, you can `vagrant ssh` into this VM's console.
- Run `vagrant destroy` when you want to shutdown the VM and delete its virtual hard-disk
- `./cache/` will contain a downloaded standard Ubuntu LiveCD ISO, so you probably want to delete your whole git clone when you've moved the generated ISO elsewhere.

## Optional: Local configuration
- If present, `./on-VM/local-apt-sources` will be copied over `/etc/apt/sources.list` within the VM created by Vagrant.
  - I used this to select a campus-local Ubuntu mirror 
- If present, `./on-VM/local-overrides.sh` will be sourced.
  - I used this to choose a campus-local LiveCD ISO to download (needed by UCK).
    (Actually I accidentally used an earlier Ubuntu than the 14.04.3 that Yuki had intended be used... 
    but at least that means I now know this Vagrant configuration works on an earlier 14.04 reslease than 14.04.3...)
