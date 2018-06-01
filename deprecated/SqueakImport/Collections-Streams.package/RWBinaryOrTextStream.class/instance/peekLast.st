accessing
peekLast
	"Return that item just put at the end of the stream"

	^ position > 0 
		ifTrue: [self isBinary
			ifTrue: [(collection at: position) asInteger]
			ifFalse: [(collection at: position) asCharacter]]
		ifFalse: [nil]