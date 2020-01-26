#! /bin/sh
dpkg-query --show --showformat "\${Package}\n" > ubuntu_packages.log
snap list > snap_list.log
