*SqClasses-message handling
perform: aSymbol with: anObject 
	"Send the selector, aSymbol, to the receiver with anObject as its argument.
	Fail if the number of arguments expected by the selector is not one.
	Primitive. Optional. See Object documentation whatIsAPrimitive."

	^ self _env0 perform: aSymbol env: 7 withArguments: (Array with: anObject)
