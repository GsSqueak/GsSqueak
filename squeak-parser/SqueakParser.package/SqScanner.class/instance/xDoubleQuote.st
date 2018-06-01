multi-character scans
xDoubleQuote
	"Collect a comment."
	buffer reset.
	self step.
	[hereChar == $"]
		whileFalse: [hereChar == DoItCharacter
				ifTrue: [^ self offEnd: 'Unmatched comment quote'].
			buffer nextPut: self step].
	self step.
	(currentComment
		ifNil: [currentComment := OrderedCollection new])
		add: buffer contents.
	self scanToken