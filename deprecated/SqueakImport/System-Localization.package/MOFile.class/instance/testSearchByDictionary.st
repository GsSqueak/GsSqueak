experimental
testSearchByDictionary
	InternalTranslator allKnownPhrases 
		do: [:each |
			self searchByDictionary: each
		].
	