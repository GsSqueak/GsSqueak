utilities
forceNonSubPixelDuring: aBlock 
	"Forces all font rendering to suppress subpixel anti-aliasing
	during the execution of aBlock"
	ForceNonSubPixelCount
		ifNil: [ForceNonSubPixelCount := 0].
	ForceNonSubPixelCount := ForceNonSubPixelCount + 1.
	aBlock
		ensure: [ForceNonSubPixelCount := ForceNonSubPixelCount - 1]