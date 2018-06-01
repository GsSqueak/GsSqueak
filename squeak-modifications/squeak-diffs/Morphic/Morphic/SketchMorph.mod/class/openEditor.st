instance creation
openEditor
	"Create a new SketchMorph and open a SketchMorphEditor on it. 
	Answers the painted SketchMorph."
	"SketchMorph openEditor"
	| newSketch |
	newSketch := (self
				withForm: (Form extent: 100 @ 100 depth: Display depth)) center: self currentWorld center;
				 openInWorld;
				 editDrawing.
	^ newSketch