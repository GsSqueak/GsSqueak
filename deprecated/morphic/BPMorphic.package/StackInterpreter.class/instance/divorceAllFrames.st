frame access
divorceAllFrames
	| _gsSqueakTemp_activeContext |
	stackPage ~= 0
		ifTrue: [self externalWriteBackHeadFramePointers].
	_gsSqueakTemp_activeContext := self ensureFrameIsMarried: framePointer SP: stackPointer + objectMemory wordSize.
	0
		to: numStackPages - 1
		do: [:i | 
			| aPage |
			aPage := stackPages stackPageAt: i.
			(stackPages isFree: aPage)
				ifFalse: [self divorceFramesIn: aPage]].
	self zeroStackPage.
	^ _gsSqueakTemp_activeContext