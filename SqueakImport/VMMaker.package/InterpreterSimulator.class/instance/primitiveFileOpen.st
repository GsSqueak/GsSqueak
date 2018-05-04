file primitives
primitiveFileOpen
	| namePointer writeFlag fileName f |
	writeFlag := self booleanValueOf: self stackTop.
	namePointer := self stackValue: 1.
	self success: (objectMemory isBytes: namePointer).
	self successful ifTrue:
		[fileName := self stringOf: namePointer.
		filesOpen addLast: (writeFlag
			ifTrue: [f := FileStream fileNamed: fileName.
					f ifNil: [^ self primitiveFail] ifNotNil: [f binary]]
			ifFalse: [(StandardFileStream isAFileNamed: fileName)
				ifTrue: [f := (FileStream readOnlyFileNamed: fileName).
						f ifNil:[^self primitiveFail] ifNotNil:[f binary]]
				ifFalse: [^ self primitiveFail]]).
		self pop: 3 thenPushInteger: filesOpen size]