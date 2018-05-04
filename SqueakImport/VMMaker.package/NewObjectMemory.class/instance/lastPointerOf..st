object enumeration
lastPointerOf: oop 
	"Return the byte offset of the last pointer field of the given object.  
	 Can be used even when the type bits are not correct.
	 Works with CompiledMethods, as well as ordinary objects."
	| fmt header contextSize |
	<inline: true>
	<asmLabel: false>
	header := self baseHeader: oop.
	fmt := self formatOfHeader: header.
	fmt <= 4 ifTrue:
		[(fmt = 3
		  and: [interpreter isContextHeader: header]) ifTrue:
			["contexts end at the stack pointer"
			contextSize := coInterpreter fetchStackPointerOf: oop.
			^CtxtTempFrameStart + contextSize * self bytesPerWord].
		^(self sizeBitsOfSafe: oop) - self baseHeaderSize  "all pointers"].
	fmt < 12 ifTrue: [^0]. "no pointers"

	"CompiledMethod: contains both pointers and bytes"
	^(coInterpreter literalCountOf: oop) * self bytesPerWord + self baseHeaderSize