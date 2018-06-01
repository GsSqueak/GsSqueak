debug printing
findHomeForContext: aContext 
	| _gsSqueakTemp_closureOrNil |
	(objectMemory isContext: aContext)
		ifFalse: [^ nil].
	_gsSqueakTemp_closureOrNil := objectMemory fetchPointer: ClosureIndex ofObject: aContext.
	_gsSqueakTemp_closureOrNil = objectMemory nilObject
		ifTrue: [^ aContext].
	ClassBlockClosureCompactIndex ~= 0
		ifTrue: [((objectMemory compactClassIndexOf: _gsSqueakTemp_closureOrNil)
						~= ClassBlockClosureCompactIndex
					and: [(objectMemory compactClassIndexOf: _gsSqueakTemp_closureOrNil)
							~= ClassFullBlockClosureCompactIndex])
				ifTrue: [^ nil]]
		ifFalse: [(objectMemory fetchClassOf: _gsSqueakTemp_closureOrNil)
					~= (objectMemory splObj: ClassBlockClosure)
				ifTrue: [(ClassFullBlockClosureCompactIndex ~= 0
							and: [(objectMemory fetchClassOf: _gsSqueakTemp_closureOrNil)
									= (objectMemory splObj: ClassFullBlockClosure)])
						ifFalse: [^ nil]]].
	^ self
		findHomeForContext: (objectMemory fetchPointer: ClosureOuterContextIndex ofObject: _gsSqueakTemp_closureOrNil)