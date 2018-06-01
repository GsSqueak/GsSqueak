actions
clear: clearButton with: clearSelector evt: evt

	| ss |
	(ss := self focusMorph) 
		ifNotNil: [ss clearPainting: self]
		ifNil: [self notCurrentlyPainting].
	clearButton state: #off.