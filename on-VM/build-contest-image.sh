#!/bin/bash

# Vagrant shell provisioners run as root

echo "--> Start Vagrant shell provisioner: $0"

. /vagrant/on-VM/config.sh
. /vagrant/on-VM/local-overrides.sh

ISO_IMAGE="/vagrant/cache/$(basename $ISO_URL)"

if [ -e $ISO_IMAGE ]
then
    echo "$ISO_IMAGE already present. Continuing."
else
    DIR="$(dirname $ISO_IMAGE)"
    [ -d "$DIR" ] || mkdir -p "$DIR"
    echo "Downloading $ISO_URL to $ISO_IMAGE."
    pushd /vagrant/cache
    curl -s -S -C - -O $ISO_URL
    popd
fi

if [ -e /vagrant/on-VM/local-apt-sources ]
then
    cp /vagrant/on-VM/local-apt-sources /etc/apt/sources.list
    chmod 664 /etc/apt/sources.list
fi

apt-get update -y
apt-get install -y uck syslinux

uck-remaster "$ISO_IMAGE" /vagrant/on-VM/uck-customization-scripts

mv /root/tmp/remaster-new-files/livecd.iso /vagrant/cache/

echo "--> cache/livecd.iso will now exist if provisioner completed successfully."
