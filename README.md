# GsSqueak

This project emerged from a bachelor's project at the [HPI Software Architechture Group](https://github.com/hpi-swa-lab) in the year 2017/18. It was named "Programmieren direkt in der Datenbank - ..." .

Part of the project was to modify [Squeak/Smalltalk](https://squeak.org/) to be able to import it into the [GemStone/Smalltalk](https://gemtalksystems.com/products/gs64/) ecosystem. The core modifications are necessary to use the GemStone VM instead of the Squeak VM.

## Related Work

The project is based on ideas first developed in Ruby [MagLev](https://github.com/MagLev/maglev). GemStone was extended by an environment concept to separate method dictionaries of classes. That way multiple different implementations of methods and even different languages could be integrated into GemStone without changing the programming environment or VM.
Another project similar to this one was started, called [PharoGS](https://github.com/dalehenrich/PharoGs), where Pharo was modified the same way we did with Squeak. The project is discontinued though.

## Project Structure

## Installation

### Prerequisites

Install [GsDevKit_home](https://github.com/GsDevKit/GsDevKit_home):
```
git clone https://github.com/GsDevKit/GsDevKit_home.git
pushd GsDevKit_home
. bin/defHOME_PATH.env    # define GS_HOME env var and put $GS_HOME into PATH
popd
installServerClient
```

Download latest EA-Drop of [GemStone](https://downloads.gemtalksystems.com/pub/GemStone64/)
```
downloadGemStone -f -d 3.5.0-EA-43870 3.5.0 # download version will change with each drop
```

### Setting up GsSqueak
Create Stone and prepare essential support
```
pushd $GS_HOME/shared/repos
git clone https://github.com/hpi-swa-lab/BP2017RH1.git
pushd BP2017RH1
setupScript für Stone inkl. Env0-Pakete laden (zukünftig alle in /squeak-modifications/pre-squeak-import)
popd
popd
```

Download [Squeak 6.0alpha17822](http://files.squeak.org/6.0alpha/Squeak6.0alpha-17822-64bit/)
Install GemStoneGUI and GsSqueakImport [see here](https://github.com/hpi-swa-lab/BP2017RH1/tree/master/tools)

Start a new GemStone session with `GSGRepositoryManager open.` and login.
Click `Load GsSqueak`

## Usage
