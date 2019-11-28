#!/bin/sh

# spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add -
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list

# darktable
add-apt-repository ppa:pmjdebruijn/darktable-release

# mkvtoolnix
curl -L https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add -
echo "deb https://mkvtoolnix.download/ubuntu/ eoan main" > /etc/apt/sources.list.d/mkvtoolnix.list

# Update package lists
apt-get update