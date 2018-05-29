tokenizing
nextToken
	| c |
	self skipSeparators.
	c := self peekChar.
	c ifNil: [ ^nil ].
	c = $( ifTrue: [ ^self nextComment ].
	c = $" ifTrue: [ ^self nextQuotedString ].
	c = $[ ifTrue: [ ^self nextDomainLiteral ].
	(self class specialsSet includes: c) ifTrue: [ ^self nextSpecial ].
	^self nextAtom