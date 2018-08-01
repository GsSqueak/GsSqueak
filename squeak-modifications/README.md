# pre-squeak-import

A collection of all packages needed to bootstrap Squeak into GemStone. The are imported in the `installation.sh`

# squeak-diffs
This directory includes all changes to the base Squeak image. We used [Squeak 6.0 alpha 17822 64bit](http://files.squeak.org/6.0alpha/Squeak6.0alpha-17822-64bit/) with the compiled Method from [Squeak 5.1](http://files.squeak.org/5.1/Squeak5.1-16549-32bit/Squeak5.1-16549-32bit-All-in-One.zip)

## Format

`├── configuration.json` - File specifying which catgorys to load and in which order to initalize the classes  
`└── Category` - Can be nested, there is no depth limit for the class Definitions  
`　├── Class.mod`  - Folder containing only methods with changes to the Squeak class. Remaining mehtods will be taken from the Squeak Image during bootstrapping. Internal Structure like in [Cypress/FileTree](https://github.com/dalehenrich/filetree)  
`　├── Class.new`  - Folder containing all methods that will be installed into GemStone. No methods from Squeak are used. Internal Structure like in [Cypress/FileTree](https://github.com/dalehenrich/filetree)  
`　├── Class.link` - Folder containing all methods that will be installed into GemStone. No methods from Squeak are used. Uses the GemStone Class instead of creating a new. Internal Structure like in [Cypress/FileTree](https://github.com/dalehenrich/filetree)  
`　└── Class.linkmod` - Folder containing only methods with changes to the Squeak class. Remaining mehtods will be taken from the Squeak Image during bootstrapping. Uses the GemStone Class instead of creating a new. Internal Structure like in [Cypress/FileTree](https://github.com/dalehenrich/filetree)

## Usage
The File Format can be read by the GSG Tools running in Squeak. It can be found in `/tools`.
