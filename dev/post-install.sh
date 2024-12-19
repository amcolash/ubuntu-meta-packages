#!/bin/bash

# use docker w/o needing root, instead part of the docker group
if [ ! $(getent group docker) ]; then
  groupadd docker

  # Add ME to the docker group. Not great practice for a package, but meh
  if [ $(getent passwd andrew) ]; then
    usermod -aG docker andrew
  fi

  if [ $(getent passwd amcolash) ]; then
    usermod -aG docker amcolash
  fi
fi

# start docker on boot
systemctl enable docker.service
systemctl enable containerd.service

echo "Docker install complete. Make sure to reboot before using docker."

# Remind to install node via nvm (user specific)
echo "---------------------------------------"
echo "Don't forget to install nvm and nodejs"
echo "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash"
echo "nvm install --lts && nvm use --lts"
echo "---------------------------------------"
