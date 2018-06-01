top window
extantSketchEditor
	"If my world has an extant SketchEditorMorph associated with
	anything 
	in this window, return that SketchEditor, else return nil"
	| _gsSqueakTemp_w _gsSqueakTemp_sketchEditor _gsSqueakTemp_pasteUp |
	(_gsSqueakTemp_w := self world) isNil
		ifTrue: [^ nil].
	(_gsSqueakTemp_sketchEditor := _gsSqueakTemp_w sketchEditorOrNil) isNil
		ifTrue: [^ nil].
	(_gsSqueakTemp_pasteUp := _gsSqueakTemp_sketchEditor enclosingPasteUpMorph) isNil
		ifTrue: [^ nil].
	self
		findDeepSubmorphThat: [:m | m = _gsSqueakTemp_pasteUp]
		ifAbsent: [^ nil].
	^ _gsSqueakTemp_sketchEditor