*SqClasses-message handling
perform: aSymbol with: firstObject with: secondObject with: thirdObject with: fourthObject
	"Send the selector, aSymbol, to the receiver with the given arguments.
	Fail if the number of arguments expected by the selector is not four.
	Primitive. Optional. See Object documentation whatIsAPrimitive."

	^ self _env0 perform: aSymbol env: 7 withArguments: (Array with: firstObject with: secondObject with: thirdObject with: fourthObject)
