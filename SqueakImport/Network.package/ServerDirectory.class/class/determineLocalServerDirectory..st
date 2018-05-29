server prefs
determineLocalServerDirectory: directoryName
	"This is part of a workaround for Mac file name oddities regarding relative file names.
	The real fix should be in fullNameFor: but that seems to break other parts of the system."

	| dirName |
	dirName := directoryName.
	(Smalltalk platformName = 'Mac OS'
		and: [directoryName beginsWith: ':'])
			ifTrue: [
				dirName := (FileDirectory default pathName endsWith: directoryName)
					ifTrue: [FileDirectory default pathName]
					ifFalse: [(FileDirectory default pathName , directoryName) replaceAll: '::' with: ':']].
	^FileDirectory default directoryNamed: dirName