system attributes
vmVMMakerVersion	
	"Answer the version number of the VMMaker package from which the main VM was compiled."
	"Smalltalk vmVMMakerVersion"

	| vmMakerID |
	vmMakerID := self vmVersion substrings detect: [:token| token beginsWith: 'VMMaker'].
	^Integer readFrom: (vmMakerID subStrings: '.') last
