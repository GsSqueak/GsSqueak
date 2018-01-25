mathematical functions
log
	self > 0 ifTrue: [^super log].
	^DomainError signal: 'log is only defined for x > 0'