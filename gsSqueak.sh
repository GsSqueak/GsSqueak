#!/usr/bin/env bash

stone_name="gsSqueak"
key="$1"
case $key in
    -s|--stone-name)
      STONE_NAME="$2"
      shift
      shift
      ;;
    *)    # unknown option
      install_usage
      # not supported
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
esac
done
set -- "${POSITIONAL[@]}"

pushd GsDevKit_home >/dev/null
source bin/defHOME_PATH.env
popd >/dev/null
startTopaz $stone_name -l << EOF
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
