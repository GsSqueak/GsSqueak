directory tree
directoryNameOf: aDirectory 
	"Attempt to find the name of ServerDirectories when used."
	^ (aDirectory isRemoteDirectory
			and: [aDirectory isKindOf: ServerDirectory])
		ifTrue: [ServerDirectory servers keyAtIdentityValue: aDirectory]
		ifFalse: [aDirectory localName]