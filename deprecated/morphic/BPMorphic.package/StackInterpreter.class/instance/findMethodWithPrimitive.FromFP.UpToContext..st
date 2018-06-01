handler search
findMethodWithPrimitive: primitive FromFP: startFP UpToContext: homeContext 
	"See findUnwindThroughContext:. Alas this is mutually recursive with
	findMethodWithPrimitive:FromContext:ThroughContext: instead of
	iterative. We're doing the simplest thing that could possibly work.
	Niceties can wait."
	| _gsSqueakTemp_theFP _gsSqueakTemp_theFPAbove _gsSqueakTemp_theSP _gsSqueakTemp_theMethod _gsSqueakTemp_senderContext |
	_gsSqueakTemp_theFP := startFP.
	_gsSqueakTemp_theFPAbove := startFP.
	[((self frameHasContext: _gsSqueakTemp_theFP)
			and: [homeContext
					= (self frameContext: _gsSqueakTemp_theFP)])
		ifTrue: [^ 0].
	(primitive = 0
			or: [self frameIsBlockActivation: _gsSqueakTemp_theFP])
		ifFalse: [_gsSqueakTemp_theMethod := self frameMethodObject: _gsSqueakTemp_theFP.
			(self primitiveIndexOf: _gsSqueakTemp_theMethod)
					= primitive
				ifTrue: [_gsSqueakTemp_theFP = _gsSqueakTemp_theFPAbove
						ifTrue: [_gsSqueakTemp_theSP := self
										findSPOf: _gsSqueakTemp_theFP
										on: (stackPages stackPageFor: _gsSqueakTemp_theFP)]
						ifFalse: [_gsSqueakTemp_theSP := self frameCallerStackPointer: _gsSqueakTemp_theFPAbove].
					^ self ensureFrameIsMarried: _gsSqueakTemp_theFP SP: _gsSqueakTemp_theSP]].
	_gsSqueakTemp_theFPAbove := _gsSqueakTemp_theFP.
	_gsSqueakTemp_theFP := self frameCallerFP: _gsSqueakTemp_theFP.
	_gsSqueakTemp_theFP ~= 0] whileTrue.
	_gsSqueakTemp_senderContext := self frameCallerContext: _gsSqueakTemp_theFPAbove.
	(objectMemory isContext: _gsSqueakTemp_senderContext)
		ifFalse: [^ objectMemory nilObject].
	^ self
		findMethodWithPrimitive: primitive
		FromContext: _gsSqueakTemp_senderContext
		UpToContext: homeContext