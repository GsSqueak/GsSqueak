submorphs-accessing
rootMorphsAtGlobal: aPoint
	"Return the list of root morphs containing the given point, excluding the receiver.
	ar 11/8/1999: Moved into morph for an incredibly ugly hack in 3D worlds"

	^ self rootMorphsAt: (self pointFromWorld: aPoint)