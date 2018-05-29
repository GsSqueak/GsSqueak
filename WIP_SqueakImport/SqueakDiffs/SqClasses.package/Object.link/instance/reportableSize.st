printing
reportableSize
	"Answer a string that reports the size of the receiver -- useful for showing in a list view, for example"

	^ (self basicSize + self class instSize) printString
