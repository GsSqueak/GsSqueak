utilities
transfer: count fromIndex: firstFrom ofObject: fromOop toIndex: firstTo ofObject: toOop
	"Transfer the specified fullword fields, as from calling context to called context"
	
	"Assume: beRootIfOld: will be called on toOop."
	| fromIndex toIndex lastFrom |
	<inline: true>
	self flag: #Dan.  "Need to check all senders before converting this for 64 bits"
	fromIndex := fromOop + (firstFrom * objectMemory bytesPerWord).
	toIndex := toOop + (firstTo * objectMemory bytesPerWord).
	lastFrom := fromIndex + (count * objectMemory bytesPerWord).
	[objectMemory oop: fromIndex isLessThan: lastFrom]
		whileTrue: [fromIndex := fromIndex + objectMemory bytesPerWord.
			toIndex := toIndex + objectMemory bytesPerWord.
			objectMemory
				longAt: toIndex
				put: (objectMemory longAt: fromIndex)]