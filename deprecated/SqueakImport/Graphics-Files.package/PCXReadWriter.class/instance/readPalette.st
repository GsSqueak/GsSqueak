private-decoding
readPalette

	| r g b array |
	self next = 12 ifFalse: [self error: 'no Color Palette!'].
	array := Array new: (1 bitShift: bitsPerPixel).
	1 to: array size do:
		[:i |
		r := self next.  g := self next.  b := self next.
		array at: i put: (Color r: r g: g b: b range: 255)].
	^ array.
