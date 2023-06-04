#!/bin/sh

############ CORE ############

# Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

############ UI ############

# Papirus Icon Theme
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9461999446FAF0DF770BFC9AE58A9D36647CAE7F
echo "deb http://ppa.launchpad.net/papirus/papirus-dev/ubuntu jammy main" > /etc/apt/sources.list.d/papirus.list

############ DEV ############

# node 18.x
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo 'deb https://deb.nodesource.com/node_18.x jammy main' > /etc/apt/sources.list.d/nodesource.list

# vs code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
rm packages.microsoft.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable" > /etc/apt/sources.list.d/docker-ce.list

############ MEDIA ############

# spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 5E3C45D7B312C643
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list

# darktable
curl -L https://download.opensuse.org/repositories/graphics:darktable/xUbuntu_22.04/Release.key | apt-key add -
echo "deb http://download.opensuse.org/repositories/graphics:/darktable/xUbuntu_22.04/ /" > /etc/apt/sources.list.d/darktable.list

# mkvtoolnix
curl -L https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add -
echo "deb [arch=amd64] https://mkvtoolnix.download/ubuntu/ jammy main" > /etc/apt/sources.list.d/mkvtoolnix.list

# steam
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F24AEA9FB05498B7
echo "deb [arch=amd64,i386] http://repo.steampowered.com/steam/ precise steam" > /etc/apt/sources.list.d/steam.list

# High Quality Bluetooth Codecs
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 252843F425723ACAADF94155ABF911E15B285843
# echo "deb http://ppa.launchpad.net/berglh/pulseaudio-a2dp/ubuntu jammy main" > /etc/apt/sources.list.d/pulseaudio-a2dp.list

############ UTIL ############

# Arronax
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E53B0E36210D2EDBFA94E8AB5AF549300FEB6DD9
echo "deb http://ppa.launchpad.net/diesch/stable/ubuntu jammy main" > /etc/apt/sources.list.d/diesch.list

# Slack
curl -L https://packagecloud.io/slacktechnologies/slack/gpgkey | apt-key add -
echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" > /etc/apt/sources.list.d/slack.list

# TeamViewer
curl -L https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | apt-key add -

# Have to do this so this matches the package version
cat > /etc/apt/sources.list.d/teamviewer.list << EOF
###   TeamViewer DEB repository list

### NOTE: Manual changes to this file
###        - prevent it from being updated by TeamViewer package updates
###        - will be lost after using the 'teamviewer repo' command
###       The original file can be restored with this command:
###       cp /opt/teamviewer/tv_bin/script/teamviewer.list /etc/apt/sources.list.d/teamviewer.list
###       which has the same effect as 'teamviewer repo default'

### NOTE: It is preferred to use the following commands to edit this file:
###       teamviewer repo                - show current repository configuration
###       teamviewer repo default        - restore default configuration
###       teamviewer repo disable        - disable the repository
###       teamviewer repo stable         - make all regular TeamViewer packages available (default)
###       teamviewer repo preview        - additionally, make feature preview packages available
###       teamviewer repo development    - additionally, make the latest development packages available


deb http://linux.teamviewer.com/deb stable main

# deb http://linux.teamviewer.com/deb preview main
# deb http://linux.teamviewer.com/deb development main
EOF

# Albert
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_22.04/Release.key | apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_22.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list

# Etcher
curl -1sLf "https://dl.cloudsmith.io/public/balena/etcher/gpg.70528471AFF9A051.key" | apt-key add -
echo "deb https://dl.cloudsmith.io/public/balena/etcher/deb/linuxmint ulyssa main" > /etc/apt/sources.list.d/balena-etcher.list

# Discord
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 08633B4AAAEB49FC
echo "deb [arch=amd64] https://ppa.javinator9889.com all main" > /etc/apt/sources.list.d/javinator9889-ppa.list

# Howdy
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 2802FD7D4CBF1B050BDE8F3D8CEBC97F3E9E1D58
echo "deb http://ppa.launchpad.net/boltgolt/howdy/ubuntu jammy main" > /etc/apt/sources.list.d/boltgolt-howdy-focal.list

# Tuxedo
curl -fsSL https://deb.tuxedocomputers.com/0x54840598.pub.asc | apt-key add -
echo "deb https://deb.tuxedocomputers.com/ubuntu jammy main" > /etc/apt/sources.list.d/tuxedo.list

############ FINISHING UP ############

# Update package lists
apt-get update
