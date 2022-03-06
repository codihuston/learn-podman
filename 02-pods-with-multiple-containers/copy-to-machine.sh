#!/bin/bash
PODMAN_MACHINE_PRIVATE_KEY=~/.ssh/podman-machine-default
PODMAN_MACHINE_PORT=62181
podman machine ssh sudo chown -R core /var/mnt
podman machine ssh sudo chown -R core /mnt
podman machine ssh sudo mkdir -p /mnt/html
# use the podman private key for authentication (port is random, see output
# above to find it, core@localhost:XXXXX)
PODMAN_MACHINE_PORT=59080
PODMAN_MACHINE_PRIVATE_KEY=~/.ssh/podman-machine-default
# scope down permissions on this file
chmod 600 $PODMAN_MACHINE_PRIVATE_KEY
# copy the html directory to the podman machine
scp -i $PODMAN_MACHINE_PRIVATE_KEY -P $PODMAN_MACHINE_PORT -r html/ core@localhost:/mnt
