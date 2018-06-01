private
privateTempAt: index in: aContext startKeysToBlockExtents: theContextsStartKeysToBlockExtents
	| nameRefPair |
	nameRefPair := (self privateTempRefsForContext: aContext
						 startKeysToBlockExtents: theContextsStartKeysToBlockExtents)
						at: index
						ifAbsent: [aContext errorSubscriptBounds: index].
	^self privateDereference: nameRefPair last in: aContext