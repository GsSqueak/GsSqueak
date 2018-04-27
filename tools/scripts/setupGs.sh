#!/bin/bash
set -evx

git clone https://github.com/GsDevKit/GsDevKit_home.git

$GS_HOME/bin/installServerClient
tools/scripts/setupTode.sh
downloadGemStone -f -d ${DOWNLOAD:=3.5.0-EA-43870} ${GS_VERSION:=3.5.0} # download version will change with each drop


