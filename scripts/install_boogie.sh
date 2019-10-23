#!/bin/bash

git clone https://github.com/boogie-org/boogie.git
cd boogie
mozroots --import --sync
wget https://nuget.org/nuget.exe
mono ./nuget.exe restore Source/Boogie.sln
xbuild Source/Boogie.sln
