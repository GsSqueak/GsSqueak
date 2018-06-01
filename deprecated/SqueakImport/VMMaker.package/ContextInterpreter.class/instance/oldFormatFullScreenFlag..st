image save/restore
oldFormatFullScreenFlag: flagsWord
	"The full screen flags word in the image header file was originally defined as
	a boolean (low order bit of the word set for true). In more recent usage with
	StackInterpreter, the remaining bits are allocated for other purposes. This
	interpreter does not use the new bit definitions, and should clear the bits
	before saving the image."

	^ flagsWord bitAnd: 1