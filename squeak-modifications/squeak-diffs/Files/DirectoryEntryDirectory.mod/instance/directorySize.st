access
directorySize

	| size |
	size := 0.
	self asFileDirectory entriesDo: [ :entry |
		entry isDirectory
			ifTrue: [ size := size + entry directorySize ]
			ifFalse:[ size := size + entry fileSize ] ].
	^size