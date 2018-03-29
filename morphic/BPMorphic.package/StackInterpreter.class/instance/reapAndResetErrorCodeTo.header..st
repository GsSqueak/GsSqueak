primitive support
reapAndResetErrorCodeTo: theSP header: methodHeader 
	"Assuming the primFailCode is non-zero, check if the method
	consumes the error code
	and if so, assign it through theSP. Then zero the primFailCode. This is
	infrequent code,
	so keep it out of the common path."
	| _gsSqueakTemp_initialPC |
	self assert: primFailCode ~= 0.
	_gsSqueakTemp_initialPC := (self initialIPForHeader: methodHeader method: newMethod)
				+ (self sizeOfCallPrimitiveBytecode: methodHeader).
	(objectMemory byteAt: _gsSqueakTemp_initialPC)
			= (self longStoreBytecodeForHeader: methodHeader)
		ifTrue: [stackPages longAtPointer: theSP put: self getErrorObjectFromPrimFailCode].
	primFailCode := 0