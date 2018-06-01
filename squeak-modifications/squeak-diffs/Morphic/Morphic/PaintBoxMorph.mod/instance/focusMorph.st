other
focusMorph
	"Note: For backward compatibility we search the world for a SketchEditorMorph if the current focus morph is nil"
	^focusMorph ifNil:[focusMorph := self world findA: SketchEditorMorph]