visual properties
fillStyle
	"Return the current fillStyle of the receiver."
	^ self
		valueOfProperty: #fillStyle
		ifAbsent: [backgroundColor
				ifNil: [Color transparent]]