class initialization
startUpFrom: endiannessHasToBeFixed
	"In this case, do we need to swap word halves when reading this segement?"

	^endiannessHasToBeFixed
			ifTrue: [Message selector: #swapShortObjects]		"will be run on each instance"
			ifFalse: [nil].
