class initialization
initialize	"TextMorph initialize"

	"Initialize the default text editor class to use"
	DefaultEditorClass := SmalltalkEditor.

	"Initialize constants shared by classes associated with text display."

	CaretForm := (ColorForm extent: 16@5
					fromArray: #(2r001100e26 2r001100e26 2r011110e26 2r111111e26 2r110011e26)
					offset: -2@0)
					colors: (Array with: Color transparent with: Preferences textHighlightColor).

	self registerInFlapsRegistry.
