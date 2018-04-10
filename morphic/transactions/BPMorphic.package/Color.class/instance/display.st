other
display
	"Show a swatch of this color tracking the cursor until the next
	mouseClick. "
	"Color red display"
	| _gsSqueakTemp_f |
	_gsSqueakTemp_f := Form extent: 40 @ 20 depth: Display depth.
	_gsSqueakTemp_f fillColor: self.
	Cursor blank
		showWhile: [_gsSqueakTemp_f
				follow: [Sensor cursorPoint]
				while: [Sensor noButtonPressed]]