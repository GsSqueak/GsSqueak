I/O primitives
primitiveBeDisplay
	"Record the system Display object in the specialObjectsTable,
	and if possible pin the display bitmap. Further, invoke ioBeDisplay
	to alow the VM to record the location, width heigth & depth of the
	bitmap. "
	| _gsSqueakTemp_rcvr _gsSqueakTemp_bitsOop _gsSqueakTemp_depthOop _gsSqueakTemp_heightOop _gsSqueakTemp_widthOop |
	_gsSqueakTemp_rcvr := self stackTop.
	((objectMemory isPointers: _gsSqueakTemp_rcvr)
			and: [(objectMemory lengthOf: _gsSqueakTemp_rcvr)
						>= 4
					and: [_gsSqueakTemp_bitsOop := objectMemory fetchPointer: 0 ofObject: _gsSqueakTemp_rcvr.
						((objectMemory isWordsOrBytes: _gsSqueakTemp_bitsOop)
								or: [objectMemory isIntegerObject: _gsSqueakTemp_bitsOop])
							and: ["for surface plugin handles"
								(objectMemory isIntegerObject: (_gsSqueakTemp_widthOop := objectMemory fetchPointer: 1 ofObject: _gsSqueakTemp_rcvr))
									and: [(objectMemory isIntegerObject: (_gsSqueakTemp_heightOop := objectMemory fetchPointer: 2 ofObject: _gsSqueakTemp_rcvr))
											and: [objectMemory isIntegerObject: (_gsSqueakTemp_depthOop := objectMemory fetchPointer: 3 ofObject: _gsSqueakTemp_rcvr)]]]]])
		ifFalse: [^ self primitiveFailFor: PrimErrBadReceiver].
	objectMemory splObj: TheDisplay put: _gsSqueakTemp_rcvr.
	(objectMemory hasSpurMemoryManagerAPI
			and: [(objectMemory isNonImmediate: _gsSqueakTemp_bitsOop)
					and: [(objectMemory isPinned: _gsSqueakTemp_bitsOop) not]])
		ifTrue: [_gsSqueakTemp_rcvr := objectMemory pinObject: _gsSqueakTemp_bitsOop.
			"Answers 0 if memory required to pin bit not enough memory
			available. "
			_gsSqueakTemp_rcvr ~= 0
				ifTrue: [_gsSqueakTemp_bitsOop := _gsSqueakTemp_rcvr]].
	self
		ioBeDisplay: ((objectMemory isNonImmediate: _gsSqueakTemp_bitsOop)
				ifTrue: [objectMemory firstIndexableField: _gsSqueakTemp_bitsOop]
				ifFalse: [_gsSqueakTemp_bitsOop])
		width: (objectMemory integerValueOf: _gsSqueakTemp_widthOop)
		height: (objectMemory integerValueOf: _gsSqueakTemp_heightOop)
		depth: (objectMemory integerValueOf: _gsSqueakTemp_depthOop)