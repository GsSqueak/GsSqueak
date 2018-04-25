#!/bin/sh
set -ev

$GS_SCRIPTS/createClient tode
$GS_SCRIPTS/createStone GsSqueak_test_350 3.5.0
$GSSQUEAK_SCRIPTS/createGsSqueakStone GsSqueak
