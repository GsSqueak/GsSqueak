debug printing
whereIs: anOop 
	(objectMemory whereIsMaybeHeapThing: anOop)
		ifNotNil: [:where | ^ where].
	(stackPages whereIsMaybeStackThing: anOop)
		ifNotNil: [:where | ^ where].
	^ ' is no where obvious'