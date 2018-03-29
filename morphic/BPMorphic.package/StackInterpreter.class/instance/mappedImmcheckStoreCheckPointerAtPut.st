sista bytecodes
mappedImmcheckStoreCheckPointerAtPut
	"151	immCheckStoreCheckPointerAt:put:
	pointer object (Fixed sized or not) and not a context, Smi, Anything
	=> arg2 (1-based, optimised if arg1 is a constant)"
	| _gsSqueakTemp_rec _gsSqueakTemp_argIntAdjusted _gsSqueakTemp_result _gsSqueakTemp_arg1 |
	_gsSqueakTemp_rec := self internalStackValue: 2.
	_gsSqueakTemp_arg1 := self internalStackValue: 1.
	self
		assert: (objectMemory isPointers: _gsSqueakTemp_rec).
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_arg1).
	_gsSqueakTemp_argIntAdjusted := (objectMemory integerValueOf: _gsSqueakTemp_arg1)
				- 1.
	self assert: _gsSqueakTemp_argIntAdjusted >= 0.
	self assert: _gsSqueakTemp_argIntAdjusted
			< (objectMemory numSlotsOfAny: _gsSqueakTemp_rec).
	_gsSqueakTemp_result := self internalStackTop.
	self internalPop: 3.
	self internalPush: _gsSqueakTemp_result.
	objectMemory
		storePointerImmutabilityCheck: _gsSqueakTemp_argIntAdjusted
		ofObject: _gsSqueakTemp_rec
		withValue: _gsSqueakTemp_result