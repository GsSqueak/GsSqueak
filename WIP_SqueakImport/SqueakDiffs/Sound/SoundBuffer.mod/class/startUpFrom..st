objects from disk
startUpFrom: endiannessHasToBeFixed 
	"In this case, do we need to swap word halves when reading this segment?"

	^endiannessHasToBeFixed
		ifTrue: [Message selector: #swapHalves	"will be run on each instance"]
		ifFalse: [nil]