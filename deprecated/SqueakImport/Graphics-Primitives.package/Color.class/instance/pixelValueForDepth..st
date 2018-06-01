conversions
pixelValueForDepth: d
	"Answers an integer representing the bits that appear in a single pixel of this color in a Form of the given depth.
	 The depth must be one of 1, 2, 4, 8, 16, or 32. Contrast with pixelWordForDepth: and bitPatternForDepth:, which
	 answer either a 32-bit word packed with the given pixel value or a multiple-word Bitmap containing a pattern.
	 The inverse is the class message colorFromPixelValue:depth:"
	"Details:
		For depths of 8 or less, the result is a colorMap index.
		For depths of 16 and 32, it is a direct color value with 5 or 8 bits per color component."
	"Transparency:
		The pixel value zero is reserved for transparent.
		For depths greater than 8, black maps to the darkest possible blue."

	| val |
	d > 8 ifTrue: "most common case"
		[d = 32 ifTrue: "eight bits per component; top 8 bits set to all ones (opaque alpha)"
			["this subexpression is a SmallInteger in both 32- and 64-bits."
			 val :=	((rgb bitShift: -6) bitAnd: 16rFF0000) bitOr:
					(((rgb bitShift: -4) bitAnd: 16rFF00) bitOr:
					((rgb bitShift: -2) bitAnd: 16rFF)).
			"16rFF000000 & 16rFF000001 are LargeIntegers in 32-bits, SmallIntegers in 64-bits."
			^val = 0 ifTrue: [16rFF000001] ifFalse: [16rFF000000 + val]].
			
		d = 16 ifTrue: "five bits per component; top bits ignored"
			[val := (((rgb bitShift: -15) bitAnd: 16r7C00) bitOr:
					 ((rgb bitShift: -10) bitAnd: 16r03E0)) bitOr:
					 ((rgb bitShift: -5) bitAnd: 16r001F).
			^val = 0 ifTrue: [1] ifFalse: [val]].

		d = 12 ifTrue: "for indexing a color map with 4 bits per color component"
			[val := (((rgb bitShift: -18) bitAnd: 16r0F00) bitOr:
					 ((rgb bitShift: -12) bitAnd: 16r00F0)) bitOr:
					 ((rgb bitShift: -6) bitAnd: 16r000F).
			^val = 0 ifTrue: [1] ifFalse: [val]].

		d = 9 ifTrue: "for indexing a color map with 3 bits per color component"
			[val := (((rgb bitShift: -21) bitAnd: 16r01C0) bitOr:
				 ((rgb bitShift: -14) bitAnd: 16r0038)) bitOr:
				 ((rgb bitShift: -7) bitAnd: 16r0007).
			^val = 0 ifTrue: [1] ifFalse: [val]]].
	d = 8 ifTrue: [^ self closestPixelValue8].
	d = 4 ifTrue: [^ self closestPixelValue4].
	d = 2 ifTrue: [^ self closestPixelValue2]..
	d = 1 ifTrue: [^ self closestPixelValue1].

	self error: 'unknown pixel depth: ', d printString
