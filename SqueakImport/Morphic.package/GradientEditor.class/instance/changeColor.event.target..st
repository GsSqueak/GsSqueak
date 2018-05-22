change reporting
changeColor: aSketchMorph event: evt target: aMorph
	| newColor |
	newColor := aSketchMorph rotatedForm colorAt: aSketchMorph rotatedForm center.
	selectedSketch := aSketchMorph.
 	self changeColorTarget: self selector: #updateColor: originalColor: newColor value hand: evt hand.
	