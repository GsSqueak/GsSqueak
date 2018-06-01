contents
contents
	"Answer the contents of the receiver"

	^ contents == nil
		ifTrue: [currentCompiledMethod := nil. '']
		ifFalse: [self hasMessageSelected
			ifTrue: [self editContents]
			ifFalse: [currentCompiledMethod := nil. contents]]