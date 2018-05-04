object enumeration
lastPointerOf: oop 
	"Return the byte offset of the last pointer field of the given object.  
	Works with CompiledMethods, as well as ordinary objects. 
	Can be used even when the type bits are not correct."
	| fmt sz methodHeader header contextSize |
	<inline: true>
	header := self baseHeader: oop.
	fmt := header >> 8 bitAnd: 15.
	fmt <= 4 ifTrue: [(fmt = 3 and: [interpreter isContextHeader: header])
					ifTrue: ["contexts end at the stack pointer"
						contextSize := interpreter fetchStackPointerOf: oop.
						^ CtxtTempFrameStart + contextSize * self bytesPerWord].
				sz := self sizeBitsOfSafe: oop.
				^ sz - self baseHeaderSize  "all pointers"].
	fmt < 12 ifTrue: [^ 0]. "no pointers"

	"CompiledMethod: contains both pointers and bytes:"
	methodHeader := self longAt: oop + self baseHeaderSize.
	^ (methodHeader >> 10 bitAnd: 255) * self bytesPerWord + self baseHeaderSize