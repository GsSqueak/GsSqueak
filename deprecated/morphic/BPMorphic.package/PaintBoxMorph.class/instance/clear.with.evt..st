actions
clear: clearButton with: clearSelector evt: evt 
	self focusMorph
		ifNil: [self notCurrentlyPainting]
		ifNotNil: [:_gsSqueakTemp_ss | _gsSqueakTemp_ss clearPainting: self].
	clearButton state: #off