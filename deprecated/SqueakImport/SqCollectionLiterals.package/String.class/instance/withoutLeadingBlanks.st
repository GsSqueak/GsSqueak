converting
withoutLeadingBlanks
	
	"Return a copy of the receiver from which leading blanks have been
trimmed."

	
	| first |
	
	first := self findFirst: [:c | c isSeparator not ].

	first = 0 ifTrue: [^ ''].  
	
	"no non-separator character"
	
	^ self copyFrom: first to: self size

	
		
	" '    abc  d' withoutLeadingBlanks"
