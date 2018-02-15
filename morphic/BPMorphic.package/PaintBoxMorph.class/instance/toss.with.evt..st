actions
toss: cancelButton with: cancelSelector evt: evt 
	"Reject the painting. Showing noPalette is done by the block
	submitted to the SketchEditorMorph"
	owner
		ifNil: ["it happens"
			^ self].
	self focusMorph
		ifNil: [self delete]
		ifNotNil: [:_gsSqueakTemp_focus | _gsSqueakTemp_focus cancelPainting: self evt: evt].
	cancelButton state: #off