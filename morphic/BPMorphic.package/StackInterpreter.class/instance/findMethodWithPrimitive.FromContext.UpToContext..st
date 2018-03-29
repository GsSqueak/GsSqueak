handler search
findMethodWithPrimitive: primitive FromContext: senderContext UpToContext: homeContext 
	"See findUnwindThroughContext:. Alas this is mutually recursive with
	findMethodWithPrimitive:FromFP:SP:ThroughContext: instead of
	iterative. We're doing the simplest thing that could possibly work.
	Niceties can wait."
	"Being mutually-recursive with
	findMethodWithPrimitive:FromFP:UpToContext: gives the author's type
	inference algorithm headaches. Wimp out by declaring the return
	type. "
	| _gsSqueakTemp_theContext _gsSqueakTemp_theMethod |
	self
		assert: (senderContext = objectMemory nilObject
				or: [objectMemory isContext: senderContext]).
	self
		assert: (homeContext = objectMemory nilObject
				or: [objectMemory isContext: homeContext]).
	_gsSqueakTemp_theContext := senderContext.
	[_gsSqueakTemp_theContext = objectMemory nilObject
		ifTrue: [^ _gsSqueakTemp_theContext].
	self isMarriedOrWidowedContext: _gsSqueakTemp_theContext]
		whileFalse: [_gsSqueakTemp_theContext = homeContext
				ifTrue: [^ 0].
			(primitive = 0
					or: [(objectMemory fetchPointer: ClosureIndex ofObject: _gsSqueakTemp_theContext)
							~= objectMemory nilObject])
				ifFalse: [_gsSqueakTemp_theMethod := objectMemory fetchPointer: MethodIndex ofObject: _gsSqueakTemp_theContext.
					(self primitiveIndexOf: _gsSqueakTemp_theMethod)
							= primitive
						ifTrue: [^ _gsSqueakTemp_theContext]].
			_gsSqueakTemp_theContext := objectMemory fetchPointer: SenderIndex ofObject: _gsSqueakTemp_theContext].
	(self isWidowedContext: _gsSqueakTemp_theContext)
		ifTrue: [^ objectMemory nilObject].
	^ self
		findMethodWithPrimitive: primitive
		FromFP: (self frameOfMarriedContext: _gsSqueakTemp_theContext)
		UpToContext: homeContext