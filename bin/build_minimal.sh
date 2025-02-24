#!/bin/bash
apt install libcurl4-openssl-dev qrencode wireguard p7zip-full make cmake
wget https://github.com/wirewizarddev/build/releases/download/v1.0.0-minimal/ww.7z
7z x ww.7z && mv ww /usr/local/bin/ && rm ww.7z
