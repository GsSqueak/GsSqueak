drawing
drawLabelOn: aCanvas 

	| stringBounds |	
	self contents ifEmpty: [^ self].
	
	stringBounds := bounds.
	
	self hasIcon ifTrue: [
		stringBounds := stringBounds left: stringBounds left + self iconForm width + 2 ].
	
	"Vertical centering."
	stringBounds := stringBounds top: stringBounds top + stringBounds bottom - self fontToUse height // 2.
	"Horizontal centering."
	stringBounds := stringBounds left: stringBounds left + (stringBounds width - (self fontToUse widthOfString: contents) // 2) abs.

	aCanvas
		drawString: contents
		in: stringBounds
		font: self fontToUse
		color: self colorToUse.