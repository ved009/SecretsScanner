#!/bin/bash

#MAKE DIRECTORIES
mkdir -p tools

#INSTALL INTERLACE
echo -e "\n-----------------------INSTALLING INTERLACE------------------------"
cd ./tools
git clone https://github.com/codingo/Interlace.git
cd -
pip3 install --user -r ./tools/Interlace/requirements.txt
cd ./tools/Interlace/
if ! test `which sudo`; then
	python3 setup.py install	
else
	sudo python3 setup.py install
fi
cd -
echo -e "\n-----------------------FINISHED INSTALLING INTERLACE------------------------"

#INSTALL GETJSBEAUTIFY.SH
echo -e "\n-----------------------INSTALLING getjsbeautify.sh------------------------"
wget https://raw.githubusercontent.com/m4ll0k/Bug-Bounty-Toolz/master/jsbeautify.py
mv jsbeautify.py ./tools/
wget https://gist.githubusercontent.com/KathanP19/c02130b163ba5817ca2ae99f7630f60f/raw/467cbb5d3773845bfd0e15b2608d6130dd1b6cd7/getjsbeautify.sh
mv getjsbeautify.sh ./tools/
echo -e "\n-----------------------FINISHED INSTALLING getjsbeautify.sh------------------------"

#INSTALL GAU AND KATANA
echo -e "\n-----------------------INSTALLING GAU, KATANA and TRUFFLEHOG------------------------"
go install github.com/lc/gau/v2/cmd/gau@latest;
git clone https://github.com/trufflesecurity/trufflehog.git
cd trufflehog; go install
go install github.com/projectdiscovery/katana/cmd/katana@latest
echo -e "\n-----------------------FINISHED INSTALLING GAU, KATANA and TRUFFLEHOG------------------------"
