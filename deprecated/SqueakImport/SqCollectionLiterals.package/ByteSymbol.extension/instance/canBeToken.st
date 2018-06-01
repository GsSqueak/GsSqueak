*SqCollectionLiterals-testing
canBeToken
	"Optimized version for the common case."
	
	| index |
	index := 0.
	[ (index := self findSubstring: '~' in: self startingAt: index + 1 matchTable: Tokenish) = 0 ]
		whileFalse: [
			(self at: index) == $_ ifFalse: [ ^false ] ].
	^true
		
