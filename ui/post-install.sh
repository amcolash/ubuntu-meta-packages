#!/bin/bash

# Install additional MS fonts, all based off of this article:
# https://needforbits.wordpress.com/2017/07/19/install-microsoft-windows-fonts-on-ubuntu-the-ultimate-guide/

# MS ClearType Fonts (Calibri, Consolas, Candara, Corbel, Constantia, Cambria, Cambria Math)
if [ ! -d /usr/share/fonts/truetype/vista ]; then
  wget https://gist.github.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash
fi

# Tahoma
if [ ! -d /usr/share/fonts/truetype/tahoma ]; then
  mkdir -p /usr/share/fonts/truetype/tahoma
  wget https://gist.githubusercontent.com/maxwelleite/913b6775e4e408daa904566eb375b090/raw/cbfd8eb70184fa509fcab37dad7905676c93d587/ttf-ms-tahoma-installer.sh -q -O - | sudo bash
  mv /usr/share/fonts/truetype/msttcorefonts/tahoma*.ttf /usr/share/fonts/truetype/tahoma
fi

# Segoe UI
if [ ! -d /usr/share/fonts/truetype/segoeui ]; then
  mkdir -p /usr/share/fonts/truetype/segoeui
  pushd /usr/share/fonts/truetype/segoeui

  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeui.ttf?raw=true -O segoeui.ttf # regular
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuib.ttf # bold
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuii.ttf # italic
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuiz.ttf?raw=true -O segoeuiz.ttf # bold italic
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuil.ttf?raw=true -O segoeuil.ttf # light
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguili.ttf?raw=true -O seguili.ttf # light italic
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuisl.ttf?raw=true -O segoeuisl.ttf # semilight
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisli.ttf?raw=true -O seguisli.ttf # semilight italic
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisb.ttf?raw=true -O seguisb.ttf # semibold
  wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisbi.ttf?raw=true -O seguisbi.ttf # semibold italic
  fc-cache -f /usr/share/fonts/truetype/segoeui
  
  popd
fi