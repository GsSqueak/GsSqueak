class list
selectClass: classNotMeta
	^ self selectClassNamed:
		(classNotMeta
			ifNil: [ nil ]
			ifNotNil: [ classNotMeta name ]).