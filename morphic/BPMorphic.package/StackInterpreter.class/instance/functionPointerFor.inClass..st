method lookup cache
functionPointerFor: primIdx inClass: theClass 
	"Find an actual function pointer for this primitiveIndex. This is an
	opportunity to specialise the prim for the relevant class (format for
	example). Default for now is simply the entry in the base
	primitiveTable. "
	^ primIdx > MaxPrimitiveIndex
		ifTrue: [0]
		ifFalse: [primitiveTable at: primIdx]