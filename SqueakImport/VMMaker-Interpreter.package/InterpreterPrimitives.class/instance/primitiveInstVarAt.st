object access primitives
primitiveInstVarAt
	| index rcvr hdr fmt totalLength fixedFields value |
	index := self stackIntegerValue: 0.
	rcvr := self stackValue: 1.
	self successful
		ifTrue: [hdr := objectMemory baseHeader: rcvr.
			fmt := hdr >> 8 bitAnd: 15.
			totalLength := objectMemory lengthOf: rcvr baseHeader: hdr format: fmt.
			fixedFields := objectMemory fixedFieldsOf: rcvr format: fmt length: totalLength.
			(index >= 1 and: [index <= fixedFields])
				ifFalse: [self primitiveFail]].
	self successful ifTrue: [value := self subscript: rcvr with: index format: fmt].
	self successful ifTrue: [self pop: argumentCount + 1 thenPush: value]