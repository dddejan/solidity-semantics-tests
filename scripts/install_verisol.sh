#!/bin/bash 

# Dotnet
wget -q https://packages.microsoft.com/config/ubuntu/19.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update
apt-get install -y apt-transport-https
apt-get update
apt-get install -y dotnet-sdk-2.2

# Verisol
dotnet tool install VeriSol --version 0.1.1-alpha --global

# Run verisol on empty contract to download dependencies
apt-get install mlocate
contract=$(mktemp)
cat > $contract << EOM
contract Test {
}
EOM
VERISOL=$(locate VeriSol.dll)
dotnet $VERISOL $contract Test

