converting
coerceTo: cTypeString sim: interpreterSimulator

	cTypeString = 'int' ifTrue: [^ self ptrAddress].
	cTypeString = 'float *' ifTrue: [^ self asCArrayAccessor asFloatAccessor].
	cTypeString = 'int *' ifTrue: [^ self asCArrayAccessor asIntAccessor].
	cTypeString = 'unsigned' ifTrue: [^ self ptrAddress].
	^ self