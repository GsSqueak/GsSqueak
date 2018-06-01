balloon compatibility
infiniteFillRectangle: aRectangle fillStyle: aFillStyle

	self flag: #bob.		"need to fix this"

	"^aFillStyle 
		displayOnPort: (port clippedBy: aRectangle) 
		at: aRectangle origin - origin"
