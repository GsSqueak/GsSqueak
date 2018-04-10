access
referentThickness
	referent
		ifNil: [^ 32].
	^ self orientation == #horizontal
		ifTrue: [referent height]
		ifFalse: [referent width]