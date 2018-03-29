return bytecodes
findUnwindThroughContext: homeContext 
	"Search for either an unwind-protect (activation of method with
	primitive 198)
	or homeContext along the sender chain, which ever is found first.
	Return values:
	0			home context was found on sender chain with no intervening
	unwind-protects nilObj		home context could not be found =>
	cannotReturn context		the context of an intervening unwind-protect
	implies home context was found"
	"Almost always (98%) the home is on the same page, in which case we
	know it will be found."
	| _gsSqueakTemp_onSamePage _gsSqueakTemp_ctxtOrNilOrZero _gsSqueakTemp_theMethod |
	_gsSqueakTemp_onSamePage := (self isStillMarriedContext: homeContext)
				and: [(stackPages pageIndexFor: framePointer)
						= (stackPages
								pageIndexFor: (self frameOfMarriedContext: homeContext))].
	"Since nothing changes we don't need to internalize."
	_gsSqueakTemp_ctxtOrNilOrZero := self
				findMethodWithPrimitive: 198
				FromFP: framePointer
				UpToContext: homeContext.
	self
		deny: (_gsSqueakTemp_onSamePage
				and: [_gsSqueakTemp_ctxtOrNilOrZero = objectMemory nilObject]).
	_gsSqueakTemp_ctxtOrNilOrZero = 0
		ifTrue: [_gsSqueakTemp_theMethod := objectMemory fetchPointer: MethodIndex ofObject: homeContext.
			(self primitiveIndexOf: _gsSqueakTemp_theMethod)
					= 198
				ifTrue: [^ homeContext].
			^ 0].
	"If an unwind was found, can the home context be found also? No
	need to look if on the same page.
	No need to look if cannot return (ctxtOrNilOrZero = objectMemory
	nilObject) "
	(_gsSqueakTemp_onSamePage
			or: [_gsSqueakTemp_ctxtOrNilOrZero = objectMemory nilObject])
		ifFalse: [(self
					findMethodWithPrimitive: 0
					FromContext: _gsSqueakTemp_ctxtOrNilOrZero
					UpToContext: homeContext)
					= objectMemory nilObject
				ifTrue: [^ objectMemory nilObject]].
	^ _gsSqueakTemp_ctxtOrNilOrZero