sista bytecodes
mappedImmcheckMaybeContextStoreCheckPointerAtPut
	"153	immCheckMaybeContextStoreCheckPointerAt:put:
	pointer object (Fixed sized or not), Smi, Anything => arg2 (1-based,
	optimised if arg1 is a constant)"
	| _gsSqueakTemp_rec _gsSqueakTemp_argIntAdjusted _gsSqueakTemp_result _gsSqueakTemp_arg1 |
	_gsSqueakTemp_rec := self internalStackValue: 2.
	_gsSqueakTemp_arg1 := self internalStackValue: 1.
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_arg1).
	_gsSqueakTemp_argIntAdjusted := (objectMemory integerValueOf: _gsSqueakTemp_arg1)
				- 1.
	_gsSqueakTemp_result := self internalStackTop.
	self internalPop: 3.
	self internalPush: _gsSqueakTemp_result.
	(self isWriteMediatedContextInstVarIndex: _gsSqueakTemp_argIntAdjusted)
		ifTrue: [self externalizeIPandSP.
			self
				externalInstVar: _gsSqueakTemp_argIntAdjusted
				ofContext: _gsSqueakTemp_rec
				put: _gsSqueakTemp_result.
			self internalizeIPandSP]
		ifFalse: [objectMemory
				storePointerImmutabilityCheck: _gsSqueakTemp_argIntAdjusted
				ofObject: _gsSqueakTemp_rec
				withValue: _gsSqueakTemp_result]