change set utilities
fileIntoChangeSetNamed: aString fromStream: stream 
	"We let the user confirm filing into an existing ChangeSet
	or specify another ChangeSet name if
	the name derived from the filename already exists.
	Duplicated from SMSimpleInstaller.
	Should be a class-side method."

	^self withCurrentChangeSetNamed: aString
		do: [ :cs | | newName |
			newName := cs name.
			stream setConverterForCode.
			stream 
				fileInAnnouncing: 'Loading ' , newName , ' into change set ''' , newName, ''''.
			stream close]