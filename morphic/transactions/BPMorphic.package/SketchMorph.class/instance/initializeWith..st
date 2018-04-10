initialization
initializeWith: aForm 
	super initialize.
	originalForm := aForm.
	self rotationCenter: 0.5 @ 0.5.
	"relative to the top-left corner of the Form"
	rotationStyle := #normal.
	"styles: #normal, #leftRight, #upDown, or #none"
	scalePoint := 1.0 @ 1.0.
	framesToDwell := 1.
	rotatedForm := originalForm.
	"cached rotation of originalForm"
	self extent: originalForm extent