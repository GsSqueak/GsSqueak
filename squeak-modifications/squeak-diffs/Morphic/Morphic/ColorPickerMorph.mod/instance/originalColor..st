accessing
originalColor: colorOrSymbol 
	"Set the receiver's original color.  It is at this point that a command is launched to represent the action of the picker, in support of Undo."

	originalColor := (colorOrSymbol isColor) 
				ifTrue: [colorOrSymbol]
				ifFalse: [Color lightGreen].
	originalForm fill: RevertBox fillColor: originalColor.
	selectedColor := originalColor.
	self updateAlpha: originalColor alpha.
	self locationIndicator 
		center: self topLeft + (self positionOfColor: originalColor)