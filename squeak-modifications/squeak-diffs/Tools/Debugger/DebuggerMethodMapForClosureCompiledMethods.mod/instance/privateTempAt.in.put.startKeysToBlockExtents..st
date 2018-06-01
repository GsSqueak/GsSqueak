private
privateTempAt: index in: aContext put: aValue startKeysToBlockExtents: theContextsStartKeysToBlockExtents
	| nameRefPair |
	nameRefPair := (self privateTempRefsForContext: aContext
						 startKeysToBlockExtents: theContextsStartKeysToBlockExtents)
						at: index
						ifAbsent: [aContext errorSubscriptBounds: index].
	^self privateDereference: nameRefPair last in: aContext put: aValue