# GemStone GUI for Squeak
To build our own set of tools for working with GemStone, we created a way for Squeak to interface with GemStone.


## Installation
Install [OSProcess] (requires [Metacello]):
```smalltalk
Metacello new
	configuration: 'OSProcess';
	repository: 'http://www.squeaksource.com/MetacelloRepository';
	load.
```

Install FFI:
```smalltalk
Metacello new
	repository: 'http://source.squeak.org/FFI/';
	version: #stable;
	configuration: 'FFI';
	load
```

Then add this `tools` directory as a [Filetree] repository via the Monticello Browser. Install the packages in the following order: `GemStone-GCI`, `GemStoneGUI`, `GsSqueakImport`.

## Usage

Open the browser by executing:
```smalltalk
GSGBrowser open.
```

To get a more general hub:
```smalltalk
GSGRepositoryManager open
```


<!-- References -->
[OSProcess]: http://www.squeaksource.com/OSProcess.html
[Metacello]: https://github.com/Metacello/metacello
[Filetree]: https://github.com/dalehenrich/filetree
