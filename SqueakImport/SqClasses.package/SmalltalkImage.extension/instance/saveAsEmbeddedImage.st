*SqClasses-*SqClasses-*SqClasses-sources, changes log
saveAsEmbeddedImage
	"Save the current state of the system as an embedded image"

	| dir newName newImageName oldImageSegDir haveSegs |
	dir := FileDirectory default.
	newName := UIManager default request: 'Select existing VM file'
				initialAnswer: (FileDirectory localNameFor: '').
	newName = '' ifTrue: [^Smalltalk].
	newName := FileDirectory baseNameFor: newName asFileName.
	newImageName := newName.
	(dir includesKey: newImageName) 
		ifFalse: 
			[^self 
				inform: 'Unable to find name ' , newName , ' Please choose another name.'].
	haveSegs := false.
	Smalltalk at: #NativeImageSegment
		ifPresent: 
			[:theClass | 
			(haveSegs := theClass instanceCount ~= 0) 
				ifTrue: [oldImageSegDir := theClass segmentDirectory]].
	self logChange: '----SAVEAS (EMBEDDED) ' , newName , '----' 
				, Date dateAndTimeNow printString.
	self imageName: (dir fullNameFor: newImageName) asSqueakPathName.
	LastImageName := self imageName.
	self closeSourceFiles.
	haveSegs 
		ifTrue: 
			[Smalltalk at: #NativeImageSegment
				ifPresent: 
					[:theClass | | newImageSegDir | 
					newImageSegDir := theClass segmentDirectory.	"create the folder"
					oldImageSegDir fileNames do: 
							[:theName | 
							"copy all segment files"

							newImageSegDir 
								copyFileNamed: oldImageSegDir pathName , FileDirectory slash , theName
								toFileNamed: theName]]].
	self 
		snapshot: true
		andQuit: true
		embedded: true
