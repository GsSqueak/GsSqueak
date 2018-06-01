A PrimitiveError is used to answer a primitive failure code that has an associated operating system/library error.

Instance Variables
	errorName:		<Symbol>
	errorCode:		<Integer>

errorName
	- typically #'operating system error'

errorCode
	- the value of the error, a signed 64-bit value, a representation imposed by the VM; specific clients must map this error value into an unsigned value as appropriate if required

Typical usage is shown in the ficticious method below:

primitiveOperation
	<primitive: 'primitiveOperation' module: 'APlugin' error: error>
	^(error isPrimitiveError)
		ifTrue: [ self processErrorCode: error errorCode ]
		ifFalse: [ self primitiveFailed ].