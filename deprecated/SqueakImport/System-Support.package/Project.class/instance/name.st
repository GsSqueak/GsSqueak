accessing
name
	changeSet == nil ifTrue: [^ 'no name'].
	^ changeSet name