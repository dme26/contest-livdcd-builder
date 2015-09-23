# This file should be sourced to define shell variables on the VM
#
# Use local-overrides.sh to override these parameters
#
# (local-overrides.sh provides a means to keep local / sensitive data
# out of git repositories, etc.)

ISO_URL=http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-desktop-amd64.iso

CACHE=/vagrant/cache

# PCC is just a prefix to avoid nameclashes in the UCK shell
# environment on the variables below.

# Best to override this one in local-overrides.sh since judge is a sudoer!
export PCC_JUDGE_PW="notsecure"

# if "yes", then cause boot parameter to include "persistent"
export PCC_PERSISTENT="yes"
# More on persistence: the Casper system on the LiveCD can look for
# places to store data persistently, e.g. an attached hard-drive drive
# with a mountable filesystem with the label "casper-rw" (among many
# other options).

# If PCC_VBOX_GA is non=empty, download, build and include the
# specified version of the VirtualBox Guest Extensions.
export PCC_VBOX_GA="4.3.24"

export PCC_BROWSER_START_PAGE="http://dmjappprd01.sit.auckland.ac.nz/domjudge/team/"

export PCC_TIMEZONE="Pacific/Auckland"
