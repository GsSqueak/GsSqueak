interpreter access
popRemappableOop
	"Pop and return the possibly remapped object from the remap buffer."

	| oop |
	oop := remapBuffer at: remapBufferCount.
	remapBufferCount := remapBufferCount - 1.
	^ oop