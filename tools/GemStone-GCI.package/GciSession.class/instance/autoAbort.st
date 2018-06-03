Library
autoAbort

	self supportsAutoAbort ifFalse: [ ^false ].
	AutoAbort == nil ifTrue: [ AutoAbort := false ].
	^AutoAbort
