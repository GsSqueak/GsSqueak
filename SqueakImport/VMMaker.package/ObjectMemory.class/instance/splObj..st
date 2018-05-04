interpreter access
splObj: index
	"Return one of the objects in the SpecialObjectsArray"
	^ self fetchPointer: index ofObject: specialObjectsOop