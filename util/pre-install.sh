#!/bin/sh

# Arronax
add-apt-repository ppa:diesch/stable

# Slack
curl -L https://packagecloud.io/slacktechnologies/slack/gpgkey | apt-key add -
echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" > /etc/apt/sources.list.d/slack.list

# TeamViewer
curl -L https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | apt-key add -
echo "deb http://linux.teamviewer.com/deb stable main" > /etc/apt/sources.list.d/teamviewer.list

# Update package lists
apt-get update