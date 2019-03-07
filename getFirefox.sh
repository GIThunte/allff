#!/bin/bash
# Alex Zubov

FF_VERSIONS="$(echo 30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60 | tr ',' '\n')"

mkdir UNPACK
mkdir ARCHIVE

GET_FF()
{
 [ ! -z ${1} ] && wget https://ftp.mozilla.org/pub/firefox/releases/${1}.0/linux-x86_64/en-US/firefox-${1}.0.tar.bz2
}

for GV_FF in ${FF_VERSIONS}; do 
    echo "Get firefox --version ${GV_FF}"
    GET_FF ${GV_FF}
    cp firefox-${GV_FF}.0.tar.bz2 ARCHIVE/
    mv firefox-${GV_FF}.0.tar.bz2 UNPACK/ 
    cd UNPACK
    tar -xf firefox-${GV_FF}.0.tar.bz2
    mv firefox firefox-${GV_FF}.0
    rm -f firefox-${GV_FF}.0.tar.bz2
    cd .. 
done

