other
display
	"Show a swatch of this color tracking the cursor until the next mouseClick. "
	"Color red display"
	| f |
	f := Form extent: 40@20 depth: Display depth.
	f fillColor: self.
	Cursor blank showWhile:
		[f follow: [Sensor cursorPoint] while: [Sensor noButtonPressed]]