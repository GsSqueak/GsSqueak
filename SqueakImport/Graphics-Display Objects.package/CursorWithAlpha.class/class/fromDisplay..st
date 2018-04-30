instance creation
fromDisplay: aRectangle 
	"Answer an ARGB cursor with bitmap initialized from the area of the 
	display screen defined by aRectangle."

	^ (self extent: aRectangle extent depth: 32)
		offset: aRectangle extent // -2;
		fromDisplay: aRectangle;
		fixAlpha