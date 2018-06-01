instance creation
openEditor
	"Create a new SketchMorph and open a SketchMorphEditor on it. 
	Answers the painted SketchMorph."
	"SketchMorph openEditor"
	| _gsSqueakTemp_newSketch |
	_gsSqueakTemp_newSketch := (self
				withForm: (Form extent: 100 @ 100 depth: Display depth)) center: self currentWorld center;
				 openInWorld;
				 editDrawing.
	^ _gsSqueakTemp_newSketch