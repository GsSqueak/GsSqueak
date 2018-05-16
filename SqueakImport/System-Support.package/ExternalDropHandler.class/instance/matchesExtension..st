testing
matchesExtension: aExtension
	(self extension isNil or: [aExtension isNil])
		ifTrue: [^false].
	FileDirectory activeDirectoryClass isCaseSensitive
		ifTrue: [^extension = aExtension]
		ifFalse: [^extension sameAs: aExtension]