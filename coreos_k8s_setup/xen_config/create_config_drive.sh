#!/bin/bash
# This will create an iso drive that will be mounted to the VM in the Xen config
# and will be picked up by CoreOS automatically
# Not the most convenient way to provide user_data but it worked
set -e

if [[ $# -ne 2 ]]; then
  echo "usage: $0 /path/to/cloud-config.yaml /path/to/output_file.iso|/path/to/device"
  exit -1
fi

echo -n "Preparing config drive data..."
mkdir -p drive/openstack/latest
trap "echo -n 'clearing tmp data';rm -rf drive;echo 'done'" EXIT

cp $1 drive/openstack/latest/user_data
echo "done!"

echo "Making filesystem from drive..."
mkisofs -R -V "config-2" -o $2 drive
echo "done!"
exit 0
