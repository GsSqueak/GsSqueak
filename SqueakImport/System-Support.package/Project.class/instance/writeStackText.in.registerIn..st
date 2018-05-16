file in/out
writeStackText: stacks in: resourceDirectory registerIn: aCollector
	"The user's text is very valuable.  Write an extra file with just the text.  It can be read in case the Project can't be opened." 
	"Find allText for each stack, storeOn a local file in the resources folder, with a name like myProj.005.myStack.t.  Make the names be unique."

	"get project name and version"
	| resourceURL ind |
	resourceURL := self resourceUrl.
	stacks do: [:stackObj | | sn localName char trial textLoc fs |	"Construct a good file name"
		localName := self versionedFileName allButLast: 2.	"projectName.005."
		stacks size = 1 ifFalse: ["must distinguish between stacks in the project"
			(sn := stackObj knownName) ifNil: [
				sn := stackObj hash printString].	"easy name, or use hash"
			localName := localName , sn, FileDirectory dot]. 	"projectName.005.myStack."
		localName := localName , 't'.
		"See if in use because truncates same as another, fix last char, try again"
		[trial := resourceDirectory checkName: localName fixErrors: true.
		 trial endsWith: '.t'] whileFalse: [
				localName := (localName allButLast: 3) , FileDirectory dot, 't'].
		[resourceDirectory fileExists: trial] whileTrue: [
			char := trial at: (ind := trial size - 3).
			trial at: ind put: (char asciiValue + 1) asCharacter].	"twiddle it a little"
		
		"write allText in file"
		fs := resourceDirectory newFileNamed: trial.
		fs timeStamp; cr; nextPutAll: '''This is the text for a stack in this project.  Use only in an emergency, if the project file is ever unreadable.''.'; cr; cr.
		stackObj getAllText storeOn: fs.    fs close.
		textLoc := (ResourceLocator new) localFileName: trial; 
			urlString: resourceURL, '/', trial.
		aCollector locatorMap at: trial "any distinct object" put: textLoc.
		].