handling
defaultAction
	familyName ifNil: [ familyName := 'NoName' ].
	pixelSize ifNil: [ pixelSize := 12 ].

	^((familyName beginsWith: 'Comic')
		ifTrue: [ TextStyle named: (Preferences standardEToysFont familyName) ]
		ifFalse: [ TextStyle default ]) fontOfSize: pixelSize.