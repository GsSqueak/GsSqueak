testing
= aDirectoryEntry 
	"Answer whether I am equivalent in all of my file-system attributes."
	super = aDirectoryEntry ifTrue: [^ true].
	self species = aDirectoryEntry species ifFalse: [^ false].
	^ self containingDirectory = aDirectoryEntry containingDirectory
		and: [self name = aDirectoryEntry name
				and: [self modificationTime = aDirectoryEntry modificationTime
						and: [self fileSize = aDirectoryEntry fileSize]]]