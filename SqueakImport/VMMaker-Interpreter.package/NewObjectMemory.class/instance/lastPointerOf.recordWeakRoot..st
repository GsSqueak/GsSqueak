object enumeration
lastPointerOf: oop recordWeakRoot: recordWeakRoot "<Boolean>"
	"Return the byte offset of the last pointer field of the given object.  
	 Works with CompiledMethods, as well as ordinary objects. 
	 Can be used even when the type bits are not correct.
	 This is a version of lastPointerOf: for markAndTrace:.
	 Already overridden to trace stack pages for the StackInterpreter.
	 Override to ask coInterpreter to determine literalCount of methods."
	| fmt sz header contextSize |
	<inline: true>
	<asmLabel: false>
	header := self baseHeader: oop.
	fmt := self formatOfHeader: header.
	fmt <= 4 ifTrue:
		[fmt >= 3 ifTrue:
			[fmt = 4 ifTrue:
				[recordWeakRoot ifTrue:
					["And remember as weak root"
					 weakRootCount := weakRootCount + 1.
					 self assert: weakRootCount <= WeakRootTableSize.
					 weakRoots at: weakRootCount put: oop].
				"Do not trace the object's indexed fields if it's a weak class"
				^(self nonWeakFieldsOf: oop) << self shiftForWord].
			"So fmt is 3"
			(interpreter isContextHeader: header) ifTrue:
				[coInterpreter setTraceFlagOnContextsFramesPageIfNeeded: oop.
				 "contexts end at the stack pointer avoiding having to init fields beyond it"
				 contextSize := coInterpreter fetchStackPointerOf: oop.
				 self assert: ReceiverIndex + contextSize < (self lengthOf: oop baseHeader: header format: fmt).
				 ^CtxtTempFrameStart + contextSize * self bytesPerWord]].
		 sz := self sizeBitsOfSafe: oop.
		 ^sz - self baseHeaderSize  "all pointers" ].
	fmt < 12 ifTrue: [^0]. "no pointers"

	"CompiledMethod: contains both pointers and bytes"
	^(coInterpreter literalCountOf: oop) * self bytesPerWord + self baseHeaderSize