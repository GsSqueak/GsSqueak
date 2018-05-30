printing
allButScheme
	"Answer the entire url except its scheme"

	^String streamContents:[:s|
		s nextPutAll: schemeSpecificPart.
		fragment ifNotNil: [
			s nextPut: $# .
			s nextPutAll: self fragment]
	].