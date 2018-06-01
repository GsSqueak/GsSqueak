Mac reader
fixKerning: extraWidth
	"Insert one pixel (extraWidth) between each character.  And add the bits for the space character"
	"Create a space character Form.  Estimate width by ascent / 2 - 1"
	| characterForm char leftX |
	characterForm := Form extent: (ascent//2 - 1) @ self height.
	self characterFormAt: $  put: characterForm.

	"Put one pixel of space after every character.  Mac fonts have no space in the bitmap."
	extraWidth <= 0 ifTrue: [^ self].
	minAscii to: maxAscii do: [:ascii |
		char := Character value: ascii.
		leftX := xTable at: ascii + 1.
		characterForm := Form extent: 
			((self widthOf: char) + extraWidth) @ self height.
		characterForm 
			copy: (characterForm boundingBox extendBy: 
				(0-extraWidth@0))
			from: leftX@0 in: glyphs rule: Form over.
		self characterFormAt: char put: characterForm.
		].	