memory access
integerObjectOf: value
	"The simulator works with strictly positive bit patterns"
	^((value < 0
		ifTrue: [16r80000000 + value]
		ifFalse: [value])
			bitShift: 1) + 1