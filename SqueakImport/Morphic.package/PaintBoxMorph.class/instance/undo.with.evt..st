actions
undo: undoButton with: undoSelector evt: evt
	| ss |
	(ss := self focusMorph) 
		ifNotNil: [ss undoPainting: self evt: evt]
		ifNil: [self notCurrentlyPainting].
	undoButton state: #off.