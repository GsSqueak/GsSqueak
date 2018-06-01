resolving
whenResolved: aBlock
	"Evaluate aBlock when I am resolved"
	aBlock numArgs <= 1 ifFalse:[self error: 'Must be 0- or 1-argument block'].
	mutex critical: [
		(state == #pending)
			ifTrue: [resolvers := resolvers copyWith: aBlock]
			ifFalse: [self isResolved ifTrue: [self evaluateResolver: aBlock]]].
	^ nil