nebraska-*nebraska-Morphic-Remote
decodeFromStringArray: array 
	"decode the receiver from an array of strings"
	type := array first asSymbol.
	position := CanvasDecoder decodePoint: array second.
	buttons := CanvasDecoder decodeInteger: array third.
	whichButton := CanvasDecoder decodeInteger: array fourth