images
upArrow8Bit

	"convert to 8-bit and convert white to transparent to avoid gratuitous conversion every time we put one in an ImageMorph"

	^UpArrow8Bit ifNil: [
		UpArrow8Bit := (ColorForm mappingWhiteToTransparentFrom: UpArrow) asFormOfDepth: 8
	]