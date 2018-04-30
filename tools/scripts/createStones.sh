#!/bin/sh
set -evx

$GS_SCRIPTS/createClient tode
$GSSQUEAK_SCRIPTS/createGsSqueakStone ${STONE_NAME:=GsSqueak_travis_350}
