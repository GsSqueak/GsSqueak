misc
arrowDeltaFor: aGetSelector 
	"Answer the arrowDelta to use in conjunction with a readout for
	aGetSelector, which will be of the form 'getXXX'"
	costume
		ifNotNil: [^ costume renderedMorph arrowDeltaFor: aGetSelector].
	^ 1"For the future, possibly: If we want the SlotInformation for a
	user-defined slot to be able to specify a standard arrowDelta for that
	slot, we'd include something like the following... 
	| aSlotName slotInfo |
	aSlotName := Utilities inherentSelectorForGetter: aGetSelector.
	(slotInfo := self slotInfoAt: aSlotName ifAbsent: [nil]) ifNotNil:
	[^ slotInfo arrowDelta]."