accessing
upToAnyOf: subcollection do: aBlock
	"re-implement super super again...
	This is a strong indicator that ReadStream SHOULD be abstract"
	
	^self collectionSpecies new: 1000 streamContents: [ :stream |
		| ch |
		[ self atEnd or: [ (subcollection includes: (ch := self next)) and: [aBlock value: ch. true] ] ] 
			whileFalse: [ stream nextPut: ch ] ]