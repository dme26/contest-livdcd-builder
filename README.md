# Programming Contest LiveCD Builder
This repository contains Vagrant configuration to allow unnattended LiveCD / LiveUSB ISO building using [Yuki's Ubuntu Construction Kit setup](https://github.com/N-Yuki/sppc-ubuntu-customisation) on any OS supported by [Vagrant](https://www.vagrantup.com) (e.g., Linux, MacOS, Windows).
## One-off setup
- Install [Vagrant](https://www.vagrantup.com) from https://www.vagrantup.com

## Usage
1. `git clone` this repository (in a shell session)
1. `./on-VM/uck-customization-scripts/customize` will build Yuki's West Australian setup.
  - Tweak this for site needs (e.g. timezone, firewally, etc).
  - (I aim to better embed Yuki's setup scripts in future than the copy/paste done here.)
1. within your clone of the repository run `vagrant up`
  - (wait a long time and/or watch the console output scroll by...)
1. `./cache/livecd.iso` should be ready to burn / run in a VM / etc.

## Clean up
- Vagrant will leave a VM running after the ISO is built.
- In your git clone's directory, you can `vagrant ssh` into this VM's console.
- Run `vagrant destroy` when you want to shutdown the VM and delete its virtual hard-disk

## Optional: Local configuration
- If present, `./on-VM/local-apt-sources` will be copied over `/etc/apt/sources.list`
  - I used this to select a campus-local Ubuntu mirror 
- If present, `./on-VM/local-overrides.sh` will be sourced.
  - I used this to choose a campus-local LiveCD ISO to download (needed by UCK).
    (Actually I accidentally used an earlier Ubuntu than the 14.04.3 that Yuki had intended be used... 
    but at least that means I now know this Vagrant configuration works on an earlier 14.04 reslease than 14.04.3...)
