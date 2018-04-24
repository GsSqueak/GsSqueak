testing
isUnicodeStringWithCJK

	self do: [:c |
		(c isTraditionalDomestic not and: [Unicode isUnifiedKanji: c charCode]) ifTrue: [
			^ true
		].
	].

	^ false.
