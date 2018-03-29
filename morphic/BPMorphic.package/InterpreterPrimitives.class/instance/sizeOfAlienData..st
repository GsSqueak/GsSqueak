primitive support
sizeOfAlienData: oop 
	"Answer the start of the Alien's data or fail if oop is not an Alien."
	| _gsSqueakTemp_size |
	(self
			is: oop
			KindOfClass: (objectMemory splObj: ClassAlien))
		ifFalse: [self primitiveFailFor: PrimErrBadArgument.
			^ 0].
	_gsSqueakTemp_size := self sizeFieldOfAlien: oop.
	^ _gsSqueakTemp_size abs