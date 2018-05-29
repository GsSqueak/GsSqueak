experimental
testSearchByHash
	InternalTranslator allKnownPhrases 
		do: [:each |
			self searchByHash: each
		].
	