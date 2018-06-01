utilities
make: newURLString relativeTo: oldURLString 
	"Local file refs are not handled well, so work around here"
	^((oldURLString includesSubstring: '://') not
		and: [(newURLString includesSubstring: '://') not])
		ifTrue: [oldURLString , (UnixFileDirectory localNameFor: newURLString)]
		ifFalse: [(newURLString asUrlRelativeTo: oldURLString asUrl) asString]