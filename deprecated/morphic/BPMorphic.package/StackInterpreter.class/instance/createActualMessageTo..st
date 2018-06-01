message sending
createActualMessageTo: lookupClass 
	"Bundle up the selector, arguments and lookupClass into a Message
	object. 
	In the process it pops the arguments off the stack, and pushes the
	message object. 
	This can then be presented as the argument of e.g.
	#doesNotUnderstand: "
	| _gsSqueakTemp_argumentArray _gsSqueakTemp_message |
	"This is a useful break-point"
	self
		assert: ((objectMemory isImmediate: messageSelector)
				or: [objectMemory addressCouldBeObj: messageSelector]).
	self mnuBreakpoint: messageSelector receiver: nil.
	objectMemory hasSpurMemoryManagerAPI
		ifTrue: [_gsSqueakTemp_argumentArray := objectMemory
						eeInstantiateSmallClassIndex: ClassArrayCompactIndex
						format: objectMemory arrayFormat
						numSlots: argumentCount.
			_gsSqueakTemp_message := objectMemory
						eeInstantiateSmallClassIndex: ClassMessageCompactIndex
						format: objectMemory nonIndexablePointerFormat
						numSlots: MessageLookupClassIndex + 1]
		ifFalse: [_gsSqueakTemp_argumentArray := objectMemory
						eeInstantiateSmallClass: (objectMemory splObj: ClassArray)
						numSlots: argumentCount.
			_gsSqueakTemp_message := objectMemory
						eeInstantiateSmallClass: (objectMemory splObj: ClassMessage)
						numSlots: MessageLookupClassIndex + 1].
	"Since the array is new can use unchecked stores."
	argumentCount - 1 * objectMemory bytesPerOop
		to: 0
		by: objectMemory bytesPerOop negated
		do: [:i | objectMemory longAt: _gsSqueakTemp_argumentArray + objectMemory baseHeaderSize + i put: self popStack].
	"Since message is new can use unchecked stores."
	objectMemory
		storePointerUnchecked: MessageSelectorIndex
		ofObject: _gsSqueakTemp_message
		withValue: messageSelector;
		
		storePointerUnchecked: MessageArgumentsIndex
		ofObject: _gsSqueakTemp_message
		withValue: _gsSqueakTemp_argumentArray;
		
		storePointerUnchecked: MessageLookupClassIndex
		ofObject: _gsSqueakTemp_message
		withValue: lookupClass.
	self push: _gsSqueakTemp_message.
	argumentCount := 1