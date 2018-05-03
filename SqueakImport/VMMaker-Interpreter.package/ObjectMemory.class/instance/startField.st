gc -- mark and sweep
startField
	"Examine and possibly trace the next field of the object being 
	traced. See comment in markAndTrace for explanation of 
	tracer state variables."
	| typeBits childType |
	<inline: true>
	child := self longAt: field.
	typeBits := child bitAnd: TypeMask.
	(typeBits bitAnd: 1) = 1
		ifTrue: ["field contains a SmallInteger; skip it"
			field := field - self bytesPerWord.
			^ StartField].
	typeBits = 0 ifTrue: ["normal oop, go down"
			self longAt: field put: parentField.
			parentField := field.
			^ StartObj].
	typeBits = 2 ifTrue: ["reached the header; do we need to process the class word? "
			(child bitAnd: CompactClassMask) ~= 0
				ifTrue: ["object's class is compact; we're done"
					"restore the header type bits"
					child := child bitAnd: self allButTypeMask.
					childType := self rightType: child.
					self longAt: field put: (child bitOr: childType).
					^ Upward]
				ifFalse: ["object has a full class word; process that class"
					child := self longAt: field - self bytesPerWord. "class word"
					child := child bitAnd: self allButTypeMask. "clear type bits"
					self longAt: field - self bytesPerWord put: parentField.
					parentField := field - self bytesPerWord bitOr: 1.
					"point at class word; mark as working on the class. "
					^ StartObj]]