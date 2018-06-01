drawing
countLabelFor: aNumber

	^ self countLabelBlock 
		ifNotNil: [:block | block value: aNumber]
		ifNil: [aNumber asString]
