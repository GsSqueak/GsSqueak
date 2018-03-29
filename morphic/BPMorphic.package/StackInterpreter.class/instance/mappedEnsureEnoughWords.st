sista bytecodes
mappedEnsureEnoughWords
	"50	EnsureEnoughWords
	literal which is a Smi => ret value is receiver"
	| _gsSqueakTemp_slots _gsSqueakTemp_ok _gsSqueakTemp_top |
	_gsSqueakTemp_top := self internalStackTop.
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	_gsSqueakTemp_slots := objectMemory integerValueOf: _gsSqueakTemp_top.
	self assert: _gsSqueakTemp_slots >= 0.
	_gsSqueakTemp_ok := objectMemory checkForAvailableSlots: _gsSqueakTemp_slots.
	_gsSqueakTemp_ok
		ifFalse: [self externalizeIPandSP.
			self checkForEventsMayContextSwitch: true.
			self browserPluginReturnIfNeeded.
			self internalizeIPandSP]