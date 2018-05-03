message sending
createActualMessageTo: aClass 
	"Bundle up the selector, arguments and lookupClass into a Message object. 
	In the process it pops the arguments off the stack, and pushes the message object. 
	This can then be presented as the argument of e.g. #doesNotUnderstand:. 
	ikp 11/20/1999 03:59 -- added hook for external runtime compilers."
	"remap lookupClass in case GC happens during allocation"
	| argumentArray message lookupClass |
	objectMemory pushRemappableOop: aClass.
	argumentArray := objectMemory instantiateClass: (objectMemory splObj: ClassArray) indexableSize: argumentCount.
	"remap argumentArray in case GC happens during allocation"
	objectMemory pushRemappableOop: argumentArray.
	message := objectMemory instantiateClass: (objectMemory splObj: ClassMessage) indexableSize: 0.
	argumentArray := objectMemory popRemappableOop.
	lookupClass := objectMemory popRemappableOop.
	objectMemory beRootIfOld: argumentArray.

	compilerInitialized
		ifTrue: [self compilerCreateActualMessage: message storingArgs: argumentArray]
		ifFalse: [self transfer: argumentCount from: stackPointer - (argumentCount - 1 * objectMemory bytesPerWord) to: argumentArray + objectMemory baseHeaderSize.
			self pop: argumentCount thenPush: message].

	argumentCount := 1.
	objectMemory storePointer: MessageSelectorIndex ofObject: message withValue: messageSelector.
	objectMemory storePointer: MessageArgumentsIndex ofObject: message withValue: argumentArray.
	(objectMemory lastPointerOf: message) >= (MessageLookupClassIndex * objectMemory bytesPerWord + objectMemory baseHeaderSize)
		ifTrue: ["Only store lookupClass if message has 3 fields (old images don't)"
			objectMemory storePointer: MessageLookupClassIndex ofObject: message withValue: lookupClass]