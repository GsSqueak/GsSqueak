frame access
checkIsStillMarriedContext: aContext currentFP: currentFP 
	"Another version of isWidowedContext: for debugging.
	This will not bereave a widowed context."
	| _gsSqueakTemp_thePage _gsSqueakTemp_maybeFP _gsSqueakTemp_limitFP _gsSqueakTemp_maybeFrameCtxt |
	((objectMemory isContext: aContext)
			and: [self isMarriedOrWidowedContext: aContext])
		ifFalse: [^ false].
	_gsSqueakTemp_maybeFP := self frameOfMarriedContext: aContext.
	_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_maybeFP.
	_gsSqueakTemp_limitFP := (_gsSqueakTemp_thePage = stackPage
					and: [currentFP notNil])
				ifTrue: [currentFP]
				ifFalse: [_gsSqueakTemp_thePage headFP].
	(_gsSqueakTemp_maybeFP >= _gsSqueakTemp_limitFP
			and: [(objectMemory isNonImmediate: (self frameCallerFP: _gsSqueakTemp_maybeFP) asInteger)
					and: [(self
								withSmallIntegerTags: (self frameCallerFP: _gsSqueakTemp_maybeFP))
								= (objectMemory fetchPointer: InstructionPointerIndex ofObject: aContext)
							and: [self frameHasContext: _gsSqueakTemp_maybeFP]]])
		ifFalse: [^ false].
	_gsSqueakTemp_maybeFrameCtxt := self frameContext: _gsSqueakTemp_maybeFP.
	"On Spur we need to follow the context to check for a match, but
	since the VM is
	only speculating about maybeFrame being a frame, and only
	speculating about
	maybeContext being a context, we need to be sure before we can
	safely follow."
	(objectMemory hasSpurMemoryManagerAPI
			and: [(stackPages isFree: _gsSqueakTemp_thePage) not
					and: [(self isFrame: _gsSqueakTemp_maybeFP onPage: _gsSqueakTemp_thePage)
							and: [objectMemory isForwarded: _gsSqueakTemp_maybeFrameCtxt]]])
		ifTrue: [_gsSqueakTemp_maybeFrameCtxt := objectMemory followForwarded: _gsSqueakTemp_maybeFrameCtxt].
	^ _gsSqueakTemp_maybeFrameCtxt = aContext