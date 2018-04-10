pen support
penOnMyForm
	"Support for experiments with drawing under program control. To get
	started, make a new SketchMorph in a morphic world. In an
	inspector, give it the desired pixel dimensions with
	clearExtent:fillColor:. Then use this method to get a pen to which you
	can send normal pen commands. Reveal the resulting drawing with
	revealPenStrokes. "
	^ Pen newOnForm: originalForm