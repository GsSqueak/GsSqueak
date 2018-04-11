class initialization
initialize
	"TextMorph initialize"
	"Initialize the default text editor class to use"
	DefaultEditorClass := SmalltalkEditor.
	"Initialize constants shared by classes associated with text display."
	CaretForm := (ColorForm
				extent: 16 @ 5
				fromArray: #(805306368 805306368 2013265920 4227858432 3422552064 )
				offset: -2 @ 0)
				colors: (Array with: Color transparent with: Preferences textHighlightColor).
	self registerInFlapsRegistry