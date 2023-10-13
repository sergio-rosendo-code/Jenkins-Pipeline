#!/bin/bash
#Source: https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian

wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.de
rm packages-microsoft-prod.deb

apt-get update
apt-get install -y dotnet-sdk-7.0.12
