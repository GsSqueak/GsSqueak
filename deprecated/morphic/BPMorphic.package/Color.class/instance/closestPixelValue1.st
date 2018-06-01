conversions
closestPixelValue1
	"Return the nearest approximation to this color for a monochrome
	Form. "
	"fast special cases"
	rgb = 0
		ifTrue: [^ 1].
	"black"
	rgb = 1073741823
		ifTrue: [^ 0"white"].
	"white"
	self luminance > 0.5
		ifTrue: [^ 0"white"]
		ifFalse: [^ 1]