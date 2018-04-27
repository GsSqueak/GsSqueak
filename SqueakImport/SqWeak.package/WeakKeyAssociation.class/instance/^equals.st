comparing
= aLookupKey

	self species = aLookupKey species
		ifTrue: [^self key = aLookupKey key]
		ifFalse: [^false]