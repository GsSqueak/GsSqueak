archive operations
addFile: aFileName as: anotherFileName
	| newMember |
	newMember := self memberClass newFromFile: aFileName.
	self addMember: newMember.
	newMember localFileName: anotherFileName.
	^newMember