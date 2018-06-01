drawing
labelFor: aValue

	^ self labelBlock 
		ifNotNil: [:block | block value: aValue]
		ifNil: [aValue asString]
