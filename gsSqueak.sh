#!/usr/bin/env bash

pushd GsDevKit_home >/dev/null
source bin/defHOME_PATH.env
popd >/dev/null
startTopaz $1 -l << EOF
login
run
Workspace evaluate: '
  Display := DisplayScreen new.
  Display setExtent: 800 @ 600 depth: 32.
  Display beDisplay.
  EventSensor startUp.
  MorphicProject new enter.
  RectangleMorph new openInWorld.
  [true] whileTrue: [Processor yield]'
%
stack
