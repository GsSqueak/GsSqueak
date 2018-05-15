utilities
versionForFileName: version
	"Project versionForFileName: 7"
	
	^String streamContents:[:s| | v |
		v := version printString.
		v size < 3 ifTrue:[v := '0', v].
		v size < 3 ifTrue:[v := '0', v].
		s nextPutAll: v.
	]
