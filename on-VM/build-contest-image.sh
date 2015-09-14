#!/bin/bash

# Vagrant shell provisioners run as root

. /vagrant/on-VM/config.sh
. /vagrant/on-VM/local-overrides.sh

ISO_IMAGE="/vagrant/cache/$(basename $ISO_URL)"

# echo $ISO_URL

if [ -e $ISO_IMAGE ]
then
    echo "$ISO_IMAGE already present. Continuing."
else
    echo "Downloading $ISO_URL to $ISO_IMAGE."
    pushd /vagrant/cache
    curl -C - -O $ISO_URL
    popd
fi

if [ -e /vagrant/on-VM/local-apt-sources ]
then
    cp /vagrant/on-VM/local-apt-sources /etc/apt/sources.list
    chmod 664 /etc/apt/sources.list
fi

apt-get update -y
apt-get install -y uck syslinux

uck-remaster /vagrant/cache/ubuntu-14.04-desktop-amd64.iso /vagrant/on-VM/uck-customization-scripts
# sudo mv ~vagrant/tmp/remaster-new-files/livecd.iso /vagrant/cache/
