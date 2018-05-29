file directory
oldFileOrNoneNamed: fullName 
	"If the file exists, answer a read-only FileStream on it. If it  
	doesn't, answer nil."
	| fileName contents |
	fileName := fullName
				allButFirst: (fullName lastIndexOf: self pathNameDelimiter).
	""
	contents := self getFullProjectContents: fileName.
	contents isNil
		ifTrue: [^ nil].
	""
	^ (SwikiPseudoFileStream with: contents) directory: self;
		 localName: fileName;
		 reset;
		 yourself