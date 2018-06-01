printing
allButScheme
	"Answer the entire url except its scheme"

	^String streamContents:[:s|
		authority ifNotNil:[self authority printOn: s].
		s nextPutAll: super allButScheme.
		query ifNotNil:[s nextPutAll: query].
	].