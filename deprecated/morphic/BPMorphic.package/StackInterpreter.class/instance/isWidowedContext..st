frame access
isWidowedContext: aOnceMarriedContext 
	"See if the argument is married to a live frame or not.
	If it is not, turn it into a bereaved single context. This version is safe
	for use
	only when no frameContext fields may be forwarded (as maybe the
	case when scavenging). Post become: all frameContext fields are
	followed, and
	hence nrmally no following of frameCOtext fields is necessary. But
	during a scavenge one must use isWidowedContextDuringGC:."
	| _gsSqueakTemp_theFrame _gsSqueakTemp_thePage _gsSqueakTemp_shouldBeFrameCallerField |
	self
		assert: ((objectMemory isContext: aOnceMarriedContext)
				and: [self isMarriedOrWidowedContext: aOnceMarriedContext]).
	_gsSqueakTemp_theFrame := self frameOfMarriedContext: aOnceMarriedContext.
	_gsSqueakTemp_thePage := stackPages stackPageFor: _gsSqueakTemp_theFrame.
	((stackPages isFree: _gsSqueakTemp_thePage)
			or: [_gsSqueakTemp_theFrame < _gsSqueakTemp_thePage headFP])
		ifFalse: ["The frame pointer is within the bounds of a live page.
			Now check if it matches a frame."
			_gsSqueakTemp_shouldBeFrameCallerField := self
						withoutSmallIntegerTags: (objectMemory fetchPointer: InstructionPointerIndex ofObject: aOnceMarriedContext).
			((self frameCallerFP: _gsSqueakTemp_theFrame)
						= _gsSqueakTemp_shouldBeFrameCallerField
					and: [self frameHasContext: _gsSqueakTemp_theFrame])
				ifTrue: [self
						deny: ((self isFrame: _gsSqueakTemp_theFrame onPage: _gsSqueakTemp_thePage)
								and: [objectMemory
										isForwarded: (self frameContext: _gsSqueakTemp_theFrame)]).
					(self frameContext: _gsSqueakTemp_theFrame)
							= aOnceMarriedContext
						ifTrue: ["It is still married!"
							^ false]]].
	"It is out of range or doesn't match the frame's context.
	It is widowed. Time to wear black."
	self markContextAsDead: aOnceMarriedContext.
	^ true