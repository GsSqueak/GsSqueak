accessing
at: key ifAbsent: aBlock

	^(array at: (self scanFor: key)) ifNil: [ aBlock value ]