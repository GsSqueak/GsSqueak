printing
reference
	^ String
		streamContents: [:t1 | self printReferenceOn: t1]