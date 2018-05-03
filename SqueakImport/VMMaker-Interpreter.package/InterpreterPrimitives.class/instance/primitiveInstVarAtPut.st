object access primitives
primitiveInstVarAtPut
	| newValue index rcvr hdr fmt totalLength fixedFields |
	newValue := self stackTop.
	index := self stackIntegerValue: 1.
	rcvr := self stackValue: 2.
	self successful
		ifTrue: [hdr := objectMemory baseHeader: rcvr.
			fmt := hdr >> 8 bitAnd: 15.
			totalLength := objectMemory lengthOf: rcvr baseHeader: hdr format: fmt.
			fixedFields := objectMemory fixedFieldsOf: rcvr format: fmt length: totalLength.
			(index >= 1 and: [index <= fixedFields]) ifFalse: [self primitiveFail]].
	self successful ifTrue: [self subscript: rcvr with: index storing: newValue format: fmt].
	self successful ifTrue: [self pop: argumentCount + 1 thenPush: newValue]