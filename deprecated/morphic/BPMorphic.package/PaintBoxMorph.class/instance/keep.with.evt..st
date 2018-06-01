actions
keep: keepButton with: keepSelector evt: evt 
	"Showing of the corrent palette (viewer or noPalette) is done by the
	block submitted to the SketchMorphEditor, see (EToyHand
	makeNewDrawing) and (SketchMorph
	editDrawingInWorld:forBackground:). "
	owner
		ifNil: [^ self].
	keepButton
		ifNotNil: [keepButton state: #off].
	self focusMorph
		ifNil: [keepSelector == #silent
				ifTrue: [^ self].
			self notCurrentlyPainting]
		ifNotNil: [:_gsSqueakTemp_ss | _gsSqueakTemp_ss savePainting: self evt: evt]