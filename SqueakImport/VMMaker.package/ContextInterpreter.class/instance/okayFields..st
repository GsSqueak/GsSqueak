debug support
okayFields: oop
	"If this is a pointers object, check that its fields are all okay oops."

	| i fieldOop c |
	(oop = nil or: [oop = 0]) ifTrue: [ ^true ].
	(objectMemory isIntegerObject: oop) ifTrue: [ ^true ].
	objectMemory okayOop: oop.
	self oopHasOkayClass: oop.
	(objectMemory isPointers: oop) ifFalse: [ ^true ].
	c := objectMemory fetchClassOf: oop.
	(c = (objectMemory splObj: ClassMethodContext)
		or: [c = (objectMemory splObj: ClassBlockContext)])
		ifTrue: [i := CtxtTempFrameStart + (self fetchStackPointerOf: oop) - 1]
		ifFalse: [i := (objectMemory lengthOf: oop) - 1].
	[i >= 0] whileTrue: [
		fieldOop := objectMemory fetchPointer: i ofObject: oop.
		(objectMemory isIntegerObject: fieldOop) ifFalse: [
			objectMemory okayOop: fieldOop.
			self oopHasOkayClass: fieldOop.
		].
		i := i - 1.
	].