actions
keep: keepButton with: keepSelector evt: evt
	"Showing of the corrent palette (viewer or noPalette) is done by the block submitted to the SketchMorphEditor, see (EToyHand makeNewDrawing) and (SketchMorph editDrawingInWorld:forBackground:)."
	| ss |
	owner ifNil: [^ self].
	keepButton ifNotNil: [keepButton state: #off].
	(ss := self focusMorph) 
		ifNotNil: [ss savePainting: self evt: evt]
		ifNil:
		[keepSelector == #silent ifTrue: [^ self].
		self notCurrentlyPainting].