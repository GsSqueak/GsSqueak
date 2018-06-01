*SqNumbers-printing
printOn: aStream base: base
	"Print the receiver with the minimal number of digits that describes it unambiguously.
	This way, every two different Float will have a different printed representation.
	More over, every Float can be reconstructed from its printed representation with #readFrom:." 

	self isNaN ifTrue: [aStream nextPutAll: 'NaN'. ^ self]. "check for NaN before sign"
	self > 0.0
		ifTrue: [self absPrintExactlyOn: aStream base: base]
		ifFalse:
			[self signBit = 1
				ifTrue: [aStream nextPutAll: '-'].
			self = 0.0
				ifTrue: [aStream nextPutAll: '0.0']
				ifFalse: [self negated absPrintExactlyOn: aStream base: base]]
