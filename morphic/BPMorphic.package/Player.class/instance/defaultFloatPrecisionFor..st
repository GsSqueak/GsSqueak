misc
defaultFloatPrecisionFor: aGetSelector 
	"Answer the float position to use in conjunction with a readout for
	aGetSelector, which will be of the form 'getXXX'"
	| _gsSqueakTemp_aSlotName |
	_gsSqueakTemp_aSlotName := aGetSelector inherentSelector.
	(self
		slotInfoAt: _gsSqueakTemp_aSlotName
		ifAbsent: [])
		ifNotNil: [:_gsSqueakTemp_slotInfo | ^ _gsSqueakTemp_slotInfo floatPrecision].
	self costume
		ifNotNil: [^ self costume renderedMorph defaultFloatPrecisionFor: aGetSelector].
	^ 1