top window
extantSketchEditor
	"If my world has an extant SketchEditorMorph associated with anything  
	in this window, return that SketchEditor, else return nil"
	| w sketchEditor pasteUp |
	(w := self world) isNil ifTrue: [^ nil].
	(sketchEditor := w sketchEditorOrNil) isNil ifTrue: [^ nil].
	(pasteUp := sketchEditor enclosingPasteUpMorph) isNil ifTrue: [^ nil].
	self findDeepSubmorphThat: [:m | m = pasteUp]
		ifAbsent: [^ nil].
	^ sketchEditor