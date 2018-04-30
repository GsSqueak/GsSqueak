printing
storeArrayValuesOn: aStream

	self isTransparent ifTrue: [
		^ aStream space].
	super storeArrayValuesOn: aStream.
	aStream
		space;
		print: self alpha maxDecimalPlaces: 3.