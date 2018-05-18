instance creation
close: aBlock
	| slot |
	slot := aBlock value: SmallInteger maxVal. "This should prevent a redraw"
	aBlock receiver freeSlot: slot.
	
