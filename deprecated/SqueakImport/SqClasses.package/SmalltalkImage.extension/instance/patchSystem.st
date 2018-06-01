*SqClasses-*SqClasses-*SqClasses-command line
patchSystem
	'patch.st' asDirectoryEntry ifNotNil:
		[ : patchEntry | patchEntry modificationTime > Smalltalk imageName asDirectoryEntry modificationTime
			ifTrue:
				[ Notification signal: 'Patching system...'.
				FileStream
					fileNamed: 'patch.st'
					do:
						[ : stream | stream fileIn ] ]
			ifFalse: [ self error: 'patch.st file is older than the image file.  Aborting.' ] ]
