frame access
frameOfMarriedContext: aContext 
	| _gsSqueakTemp_senderOop |
	_gsSqueakTemp_senderOop := objectMemory fetchPointer: SenderIndex ofObject: aContext.
	^ self withoutSmallIntegerTags: _gsSqueakTemp_senderOop