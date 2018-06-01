file directory
oldFileNamed: aName

	|  contents |
	contents := HTTPLoader default retrieveContentsFor: (self altUrl , '/' , aName).
	^(SwikiPseudoFileStream with: contents content)
		reset;
		directory: self;
		localName: aName;
		yourself
