#!/bin/bash

export IFS=$'\n'

#export PATH="/usr/libexec/git-core/:$PATH"
export MP_PREFIX="/opt/usr"
export PATH="$MP_PREFIX/bin:$MP_PREFIX/sbin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH"

CURDIR=`dirname $0`
if [ $? = 0 ]; then
	cd `dirname $0`
fi
export CURDIR=`pwd`
echo -e "\n\nRunning `basename $0`\n from $CURDIR\n"

export REVISION=_4

export FFMPEG_VER=`curl -JLks https://evermeet.cx/ffmpeg/info/ffmpeg/release | jq -r '.version'`
export ESPEAK_VER=`port info --version espeak-ng | cut -d' ' -f2`
#export PYTHON_VER=`port info --version python39 | cut -d' ' -f2`
export PYTHON_VER='3.9.13'
export AENEAS_VER=`python3 -m pip show aeneas | grep "Version:" | cut -d' ' -f2`
export NUMPY_VER=`python3 -m pip show numpy | grep "Version:" | cut -d' ' -f2`
export LXML_VER=`python3 -m pip show lxml | grep "Version:" | cut -d' ' -f2`
export BS4_VER=`python3 -m pip show beautifulsoup4 | grep "Version:" | cut -d' ' -f2`
export SOUPSIEVE_VER=`python3 -m pip show soupsieve | grep "Version:" | cut -d' ' -f2`
export VERSION="$AENEAS_VER$REVISION"

export CPLUS_INCLUDE_PATH="/opt/usr/include"
export C_INCLUDE_PATH="/opt/usr/include"
export LIBRARY_PATH="/opt/usr/lib"
export LDFLAGS="-L/opt/usr/lib"

