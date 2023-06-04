#!/bin/sh

recv_key() {
  KEY=$1
  NAME=$2

  echo Getting key for $NAME

  if [ -z "$3" ]; then
    KEYSERVER="hkps://keyserver.ubuntu.com"
  else
    KEYSERVER=$3
  fi

  gpg --keyserver $KEYSERVER --recv-keys $KEY
  gpg --export $KEY > /etc/apt/trusted.gpg.d/$NAME.gpg
  gpg --batch --yes --delete-keys $KEY
}

download_key() {
  URL=$1
  NAME=$2

  echo Getting key for $NAME

  curl -fsSL $URL | gpg --dearmor > /etc/apt/trusted.gpg.d/$NAME.gpg
}

############ CORE ############

# Chrome
download_key https://dl.google.com/linux/linux_signing_key.pub google
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

############ UI ############

# Papirus Icon Theme
recv_key 9461999446FAF0DF770BFC9AE58A9D36647CAE7F papirus
echo "deb http://ppa.launchpad.net/papirus/papirus-dev/ubuntu jammy main" > /etc/apt/sources.list.d/papirus.list

############ DEV ############

# node 18.x
download_key https://deb.nodesource.com/gpgkey/nodesource.gpg.key node18
echo 'deb https://deb.nodesource.com/node_18.x jammy main' > /etc/apt/sources.list.d/nodesource.list

# vs code
download_key https://packages.microsoft.com/keys/microsoft.asc microsoft
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

# docker
download_key https://download.docker.com/linux/ubuntu/gpg docker
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable" > /etc/apt/sources.list.d/docker-ce.list

############ MEDIA ############

# spotify
download_key https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg spotify
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list

# darktable
download_key https://download.opensuse.org/repositories/graphics:darktable/xUbuntu_22.04/Release.key darktable
echo "deb http://download.opensuse.org/repositories/graphics:/darktable/xUbuntu_22.04/ /" > /etc/apt/sources.list.d/darktable.list

# mkvtoolnix
download_key https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt mkvtoolnix
echo "deb [arch=amd64] https://mkvtoolnix.download/ubuntu/ jammy main" > /etc/apt/sources.list.d/mkvtoolnix.list

# steam
recv_key F24AEA9FB05498B7 steam
echo "deb [arch=amd64,i386] http://repo.steampowered.com/steam/ precise steam" > /etc/apt/sources.list.d/steam.list

# High Quality Bluetooth Codecs
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 252843F425723ACAADF94155ABF911E15B285843
# echo "deb http://ppa.launchpad.net/berglh/pulseaudio-a2dp/ubuntu jammy main" > /etc/apt/sources.list.d/pulseaudio-a2dp.list

############ UTIL ############

# Arronax
recv_key E53B0E36210D2EDBFA94E8AB5AF549300FEB6DD9 arronax
echo "deb http://ppa.launchpad.net/diesch/stable/ubuntu jammy main" > /etc/apt/sources.list.d/diesch.list

# Slack
download_key https://packagecloud.io/slacktechnologies/slack/gpgkey slack
echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" > /etc/apt/sources.list.d/slack.list

# TeamViewer
download_key https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc teamviewer
echo 'deb http://linux.teamviewer.com/deb stable main' > /etc/apt/sources.list.d/teamviewer.list

# Albert
download_key https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key albert
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list

# Etcher (Disabled because it's not working)
# download_key "https://dl.cloudsmith.io/public/balena/etcher/gpg.70528471AFF9A051.key" etcher
# echo "deb https://dl.cloudsmith.io/public/balena/etcher/deb/linuxmint ulyssa main" > /etc/apt/sources.list.d/balena-etcher.list

# Discord
recv_key 08633B4AAAEB49FC discord
echo "deb [arch=amd64] https://ppa.javinator9889.com all main" > /etc/apt/sources.list.d/javinator9889-ppa.list

# Howdy
recv_key 2802FD7D4CBF1B050BDE8F3D8CEBC97F3E9E1D58 howdy
echo "deb http://ppa.launchpad.net/boltgolt/howdy/ubuntu jammy main" > /etc/apt/sources.list.d/boltgolt-howdy-focal.list

# Tuxedo
download_key https://deb.tuxedocomputers.com/0x54840598.pub.asc tuxedo
echo "deb https://deb.tuxedocomputers.com/ubuntu jammy main" > /etc/apt/sources.list.d/tuxedo.list

# Dropbox
recv_key 1C61A2656FB57B7E4DE0F4C1FC918B335044912E dropbox pgp.mit.edu
echo "deb https://linux.dropbox.com/ubuntu jammy main" > /etc/apt/sources.list.d/dropbox.list

############ FINISHING UP ############

# Update package lists
apt-get update
