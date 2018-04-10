actions
undo: undoButton with: undoSelector evt: evt 
	self focusMorph
		ifNil: [self notCurrentlyPainting]
		ifNotNil: [:_gsSqueakTemp_ss | _gsSqueakTemp_ss undoPainting: self evt: evt].
	undoButton state: #off