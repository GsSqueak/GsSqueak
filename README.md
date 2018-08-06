# GsSqueak

This project emerged from a bachelor's project at the [HPI Software Architechture Group](https://github.com/hpi-swa-lab) in the year 2017/18.

Part of the project was to modify [Squeak/Smalltalk](https://squeak.org/) to be able to import it into the [GemStone/Smalltalk](https://gemtalksystems.com/products/gs64/) ecosystem. The core modifications are necessary to use the GemStone VM instead of the Squeak VM.

## Related Work

The project is based on ideas first developed in Ruby [MagLev](https://github.com/MagLev/maglev). GemStone was extended by an environment concept to separate method dictionaries of classes. That way multiple different implementations of methods and even different languages could be integrated into GemStone without changing the programming environment or VM.
Another project similar to this one was started, called [PharoGS](https://github.com/dalehenrich/PharoGs), where Pharo was modified the same way we did with Squeak. The project is discontinued though.

## Project Structure
`BP2017RH1`  
`├── bug-fixes` - Temporary bug fixes for GemStone/S  
`├── deprecated`  
`├── docs`  
`├── graffics` - Graphics Library for SDL  
`├── GsDevKit_home` - [GsDevKit_home](https://github.com/GsDevKit/GsDevKit_home) installation  
`├── misc` - helper scripts and WIP tODE integration  
`├── monticello-environment-switch` - Monticello Extension to load packages to environments  
`├── squeak-environments` - SmalltalkImage and Environment classes from Squeak for Namespacing  
`├── squeak-modifications` - Squeak bootstrap files  
`├── squeak-parser` - Modified Squeak Parser for GemStone/S  
`├── tools` - GemStone/S tools for Squeak  
`└── install.sh`  
READMEs in the subfolders go into detail regarding installation and usage of the submodules.

## Installation ([Video Guide](https://youtu.be/TLOmrb4Ty14))

1. Install SDL2 using `sudo apt-get install libsdl2-dev`

2. Execute and follow `install.sh`. This will also make changes to the rights management of the stone. DataCurator will be able to write System user classes, compile primitives and subclass from Behavior.

3. Download [`Squeak6.0alpha-17822-64bit`](https://github.com/GsSqueak/GsSqueak/releases/download/demo-release/Squeak6.0alpha-17822-64bit-All-in-One.zip)

4. Install VMMaker using `MCMcmUpdater updateFromRepository: 'http://source.squeak.org/VMMaker'`

5. Install GemStoneGUI and GsSqueakImport located in `/tools`

6. Start a new GemStone session with `GSGRepositoryManager open.` and login

7. Click `Load GsSqueak`. Choose the directory `squeak-modifications/squeak-diffs`. This starts the bootstrapping process from Squeak into the specified stone

8. If Index support is intended run `misc/gsIndexes.tpz` in topaz

9. Execute `gsSqueak.sh` to open GsSqueak

If you don't want to add GS_HOME to your path every time, add the following lines to your `.profile` file and insert the path:

```
export GS_HOME=<path to your GsDevKit_home directory>
export PATH="$GS_HOME/bin":$PATH
```

## Usage

GsSqueak is currently a proof of concept. The World renders, mouse clicks register and tools can be used. Crashes are excpected in the current state.

Tested Working
  - Workspace
  - inspector & explorer (flakey, inspecting certain objects like morphs will fail)
  - Read-only browser
  
As the Debugger in Squeak does not handle errors yet, the call stack will be printed into your terminal after GsSqueak closes.
