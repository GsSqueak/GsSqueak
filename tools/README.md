## Installation Instructions
Install the [OSProcess] dependency by executing the following code (requires [Metacello]):
```smalltalk
Metacello new
  configuration: 'OSProcess';
  repository: 'http://www.squeaksource.com/MetacelloRepository';
  load.
```

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
