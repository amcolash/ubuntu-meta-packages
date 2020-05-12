#!/bin/bash

# use docker w/o needing root, instead part of the docker group
if [ ! $(getent group docker) ]; then
  groupadd docker

  # Add ME to the docker group. Not great practice for a package, but meh
  if [ $(getent passwd andrew) ] ; then
    usermod -aG docker andrew
  fi

  if [ $(getent passwd amcolash) ] ; then
    usermod -aG docker amcolash
  fi

  # update docker group
  newgrp docker
fi

# start docker on boot
systemctl enable docker

# install compose if needed
if ! [ -x "$(command -v docker-compose)" ]; then
  curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  curl -L https://raw.githubusercontent.com/docker/compose/1.25.5/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
  chmod +x /usr/local/bin/docker-compose
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi
