#!/bin/bash
set -ev

git clone https://github.com/GsDevKit/GsDevKit_home.git
cd GsDevKit_home
export GS_HOME=`pwd`
export PATH=$GS_HOME/bin:$PATH
installServerClient






