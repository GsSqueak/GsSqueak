initialization
initializeWith: aForm

	super initialize.
	originalForm := aForm.
	rotationStyle := #normal.		"styles: #normal, #leftRight, #upDown, or #none"
	scalePoint := 1.0@1.0.
	framesToDwell := 1.
	rotatedForm := originalForm.	"cached rotation of originalForm"
	self extent: originalForm extent.
