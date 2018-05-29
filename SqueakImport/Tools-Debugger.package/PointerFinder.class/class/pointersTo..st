utilities
pointersTo: anObject
	"Find all occurrences in the system of pointers to the argument anObject."
	"(PointerFinder pointersTo: Browser) inspect."

	^ self pointersTo: anObject except: #()
