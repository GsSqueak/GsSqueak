# GsSqueak

This project emerged from a bachelor's project at the [HPI Software Architechture Group](https://github.com/hpi-swa-lab) in the year 2017/18. It was named "Programmieren direkt in der Datenbank - ..." .

Part of the project was to modify [Squeak/Smalltalk](https://squeak.org/) to be able to import it into the [GemStone/Smalltalk](https://gemtalksystems.com/products/gs64/) ecosystem. The core modifications are necessary to use the GemStone VM instead of the Squeak VM.

## Related Work

The project is based on ideas first developed in Ruby [MagLev](https://github.com/MagLev/maglev). GemStone was extended by an environment concept to separate method dictionaries of classes. That way multiple different implementations of methods and even different languages could be integrated into GemStone without changing the programming environment or VM.
Another project similar to this one was started, called [PharoGS](https://github.com/dalehenrich/PharoGs), where Pharo was modified the same way we did with Squeak. The project is discontinued though.

## Project Structure

## Installation
1. Execute and follow `install.sh`

2. Download [Squeak 6.0alpha17822](http://files.squeak.org/6.0alpha/Squeak6.0alpha-17822-64bit/)

3. Install VMMaker using `MCMcmUpdater updateFromRepository: 'http://source.squeak.org/VMMaker'`

4. Install GemStoneGUI and GsSqueakImport ([see here](https://github.com/hpi-swa-lab/BP2017RH1/tree/master/tools))

5. Start a new GemStone session with `GSGRepositoryManager open.` and login

6. Click `Load GsSqueak`. This starts the bootstrapping process from Squeak into the specified stone

7. Execute `gsSqueak.sh` to open GsSqueak

## Usage
