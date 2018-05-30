updating
changed
	"Report that the area occupied by this morph should be redrawn."
	^fullBounds 
		ifNil:[self invalidRect: self outerBounds]
		ifNotNil:[self invalidRect: fullBounds]