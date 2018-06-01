finding pointers
pointersTo: anObject 
	"Find all occurrences in the system of pointers to the argument
	anObject. "
	"(Utilities pointersTo: Browser) inspect."
	^ self pointersTo: anObject except: #()