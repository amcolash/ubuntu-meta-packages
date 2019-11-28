#!/bin/sh

# non-root docker
groupadd docker
usermod -aG docker $USER

# start docker on boot
systemctl enable docker