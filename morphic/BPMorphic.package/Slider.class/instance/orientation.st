accessing
orientation
	^ orientation
		ifNil: [bounds isWide
				ifTrue: [#horizontal]
				ifFalse: [#vertical]]