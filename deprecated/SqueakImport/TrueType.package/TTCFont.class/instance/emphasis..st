accessing
emphasis: code

	code > 3 ifTrue: [^ self].
	code = 0 ifTrue: [^ self].
	derivatives ifNil: [^ self].
	^ (derivatives at: code) ifNil: [self].
