read write
readWordLike
	| refPosn newClass anObject className |
	"Can be used by any class that is bits and not bytes (WordArray, Bitmap, SoundBuffer, etc)."

	refPosn := self getCurrentReference.
	className := self next asSymbol.
	className := renamed at: className ifAbsent: [className].
	newClass := Smalltalk at: className.
	anObject := newClass newFromStream: byteStream.
	"Size is number of long words."
	self setCurrentReference: refPosn.  "before returning to next"
	^ anObject
