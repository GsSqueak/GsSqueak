mathematical functions
ln
	self > 0 ifTrue: [^super ln].
	^DomainError signal: 'ln is only defined for x > 0'