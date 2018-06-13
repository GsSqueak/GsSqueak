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

