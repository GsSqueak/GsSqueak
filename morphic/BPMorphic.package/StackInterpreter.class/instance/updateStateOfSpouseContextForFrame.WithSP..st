frame access
updateStateOfSpouseContextForFrame: theFP WithSP: theSP 
	"Update the frame's spouse context with the frame's current state
	except for the
	sender and instruction pointer, which are used to mark the context as
	married. "
	| _gsSqueakTemp_theContext _gsSqueakTemp_tempIndex _gsSqueakTemp_pointer |
	self
		assert: (self frameHasContext: theFP).
	_gsSqueakTemp_theContext := self frameContext: theFP.
	self assert: (self frameReceiver: theFP)
			= (objectMemory fetchPointer: ReceiverIndex ofObject: _gsSqueakTemp_theContext).
	_gsSqueakTemp_tempIndex := self frameNumArgs: theFP.
	"update the arguments. this would appear not to be strictly necessary,
	but is for two reasons.
	First, the fact that arguments are read-only is only as convention in
	the Smalltalk compiler;
	other languages may choose to modify arguments.
	Second, the Squeak runUntilErrorOrReturnFrom: nightmare pops the
	stack top, which may, in
	certain circumstances, be the last argument, and hence the last
	argument may not have been
	stored into the context."
	_gsSqueakTemp_pointer := theFP
				+ (self frameStackedReceiverOffsetNumArgs: _gsSqueakTemp_tempIndex).
	1
		to: _gsSqueakTemp_tempIndex
		do: [:i | 
			_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize.
			self
				assert: (objectMemory
						addressCouldBeOop: (stackPages longAt: _gsSqueakTemp_pointer)).
			objectMemory
				storePointer: ReceiverIndex + i
				ofObject: _gsSqueakTemp_theContext
				withValue: (stackPages longAt: _gsSqueakTemp_pointer)].
	"now update the non-argument stack contents."
	_gsSqueakTemp_pointer := theFP + FoxReceiver - objectMemory wordSize.
	[_gsSqueakTemp_pointer >= theSP]
		whileTrue: [self
				assert: (objectMemory
						addressCouldBeOop: (stackPages longAt: _gsSqueakTemp_pointer)).
			_gsSqueakTemp_tempIndex := _gsSqueakTemp_tempIndex + 1.
			objectMemory
				storePointer: ReceiverIndex + _gsSqueakTemp_tempIndex
				ofObject: _gsSqueakTemp_theContext
				withValue: (stackPages longAt: _gsSqueakTemp_pointer).
			_gsSqueakTemp_pointer := _gsSqueakTemp_pointer - objectMemory wordSize].
	self assert: ReceiverIndex + _gsSqueakTemp_tempIndex
			< (objectMemory lengthOf: _gsSqueakTemp_theContext).
	objectMemory
		storePointerUnchecked: StackPointerIndex
		ofObject: _gsSqueakTemp_theContext
		withValue: (objectMemory integerObjectOf: _gsSqueakTemp_tempIndex)