alien support
sendInvokeCallback: thunkPtr Stack: stackPtr Registers: regsPtr Jmpbuf: jmpBufPtr
	"Send the 4 argument callback message invokeCallback:stack:registers:jmpbuf:
	 to Alien class with the supplied args.  The arguments are raw C addresses
	 and are converted to integer objects on the way."
	| where |
	<export: true>
	objectMemory pushRemappableOop: (self positive32BitIntegerFor: jmpBufPtr).
	objectMemory pushRemappableOop: (self positive32BitIntegerFor: regsPtr).
	objectMemory pushRemappableOop: (self positive32BitIntegerFor: stackPtr).
	objectMemory pushRemappableOop: (self positive32BitIntegerFor: thunkPtr).
	receiver := objectMemory splObj: ClassAlien.
	lkupClass := objectMemory fetchClassOfNonInt: receiver.
	messageSelector := objectMemory splObj: objectMemory invokeCallbackSelector.
	(self lookupInMethodCacheSel: messageSelector class: lkupClass) ifFalse:
	 	[(self lookupMethodNoMNUEtcInClass: lkupClass) ifFalse:
			[^false]].
	primitiveIndex ~= 0 ifTrue:
		[^false].
	self storeContextRegisters: activeContext.
	self internalJustActivateNewMethod.
	where := activeContext + objectMemory baseHeaderSize + (ReceiverIndex << objectMemory shiftForWord).
	objectMemory longAt: where + (1 << objectMemory shiftForWord) put: objectMemory popRemappableOop.
	objectMemory longAt: where + (2 << objectMemory shiftForWord) put: objectMemory popRemappableOop.
	objectMemory longAt: where + (3 << objectMemory shiftForWord) put: objectMemory popRemappableOop.
	objectMemory longAt: where + (4 << objectMemory shiftForWord) put: objectMemory popRemappableOop.
	self fetchContextRegisters: activeContext.
	self callInterpreter.
	"not reached"
	^true