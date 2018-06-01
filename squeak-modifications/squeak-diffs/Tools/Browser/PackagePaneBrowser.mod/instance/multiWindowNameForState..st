multi-window support
multiWindowNameForState: savedStateMessage
	"Answer the string to display for the receiver in a multi-window."
	| getarg |
	getarg := [:keyword| savedStateMessage arguments at: (savedStateMessage selector keywords indexOf: keyword)].
	^String streamContents:
		[:s|
		(getarg value: 'restoreToPackage:')
			ifNil: [s nextPut: $a; space; nextPutAll: self defaultBrowserTitle]
			ifNotNil:
				[:pkg|
				 s nextPutAll: pkg.
				(getarg value: 'className:')
					ifNil: [(getarg value: 'category:') ifNotNil:
							[:categoryName| s nextPut: $-; nextPutAll: categoryName]]
					ifNotNil:
						[:className|
						s space; nextPutAll: className.
						(getarg value: 'meta:') ifTrue:
							[s nextPutAll: ' class'].
						  self isHierarchy ifTrue:
							[s space; nextPutAll: ' Hierarchy'].
						(getarg value: 'selector:')
							ifNil: [(getarg value: 'protocol:') ifNotNil:
									[:protocol| s space; nextPut: ${; nextPutAll: protocol; nextPut: $}]]
							ifNotNil: [:selector| s nextPutAll: '>>'; nextPutAll: selector]]]]