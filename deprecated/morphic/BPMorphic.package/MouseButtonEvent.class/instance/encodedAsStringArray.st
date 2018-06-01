nebraska-*nebraska-Morphic-Remote
encodedAsStringArray
	"encode the receiver into an array of strings, such that it can be
	retrieved via the fromStringArray: class method"
	^ {type. CanvasEncoder encodePoint: position. CanvasEncoder encodeInteger: buttons. CanvasEncoder encodeInteger: whichButton}