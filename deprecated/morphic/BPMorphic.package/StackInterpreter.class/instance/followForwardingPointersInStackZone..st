object memory support
followForwardingPointersInStackZone: theBecomeEffectsFlags 
	"Spur's become: is lazy, turning the becommed object into a
	forwarding object to the other.
	The read-barrier is minimised by arranging that forwarding pointers
	will fail a method cache
	probe, since notionally objects' internals are accessed only via sending
	messages to them,
	the exception is primitives that access the internals of the
	non-receiver argument(s).
	
	To avoid a read barrier on bytecode, literal and inst var fetch and
	non-local return, we scan
	the receivers (including the stacked receiver for non-local return) and
	method references
	in the stack zone and follow any forwarded ones. This is of course way
	cheaper than
	scanning all of memory as in the old become."
	| _gsSqueakTemp_theIPPtr |
	self externalWriteBackHeadFramePointers.
	(theBecomeEffectsFlags anyMask: BecameCompiledMethodFlag)
		ifTrue: [(objectMemory isForwarded: method)
				ifTrue: [_gsSqueakTemp_theIPPtr := instructionPointer - method.
					method := objectMemory followForwarded: method.
					instructionPointer := method + _gsSqueakTemp_theIPPtr].
			(objectMemory isOopForwarded: newMethod)
				ifTrue: [newMethod := objectMemory followForwarded: newMethod]].
	self assert: stackPage ~= 0.
	0
		to: numStackPages - 1
		do: [:i | 
			| thePage theFP callerFP offset oop |
			thePage := stackPages stackPageAt: i.
			thePage isFree
				ifFalse: [self
						assert: (self ifCurrentStackPageHasValidHeadPointers: thePage).
					theFP := thePage headFP.
					"Skip the instruction pointer on top of stack of inactive
					pages. "
					_gsSqueakTemp_theIPPtr := thePage = stackPage
								ifTrue: [0]
								ifFalse: [thePage headSP asUnsignedInteger].
					[self
						assert: (thePage addressIsInPage: theFP).
					self
						assert: (_gsSqueakTemp_theIPPtr = 0
								or: [thePage addressIsInPage: _gsSqueakTemp_theIPPtr asVoidPointer]).
					oop := stackPages longAt: theFP + FoxReceiver.
					(objectMemory isOopForwarded: oop)
						ifTrue: [stackPages
								longAt: theFP + FoxReceiver
								put: (objectMemory followForwarded: oop)].
					((self frameHasContext: theFP)
							and: [objectMemory
									isForwarded: (self frameContext: theFP)])
						ifTrue: [stackPages
								longAt: theFP + FoxThisContext
								put: (objectMemory
										followForwarded: (self frameContext: theFP))].
					oop := self frameMethod: theFP.
					(objectMemory isForwarded: oop)
						ifTrue: [| newOop delta |
							newOop := objectMemory followForwarded: oop.
							_gsSqueakTemp_theIPPtr ~= 0
								ifTrue: [self assert: (stackPages longAt: _gsSqueakTemp_theIPPtr)
											> (self frameMethod: theFP).
									delta := newOop - oop.
									stackPages longAt: _gsSqueakTemp_theIPPtr put: (stackPages longAt: _gsSqueakTemp_theIPPtr)
											+ delta].
							stackPages longAt: theFP + FoxMethod put: (oop := newOop)].
					offset := self frameStackedReceiverOffset: theFP.
					oop := stackPages longAt: theFP + offset.
					(objectMemory isOopForwarded: oop)
						ifTrue: [stackPages
								longAt: theFP + offset
								put: (objectMemory followForwarded: oop)].
					(callerFP := self frameCallerFP: theFP) ~= 0]
						whileTrue: [_gsSqueakTemp_theIPPtr := (theFP + FoxCallerSavedIP) asUnsignedInteger.
							theFP := callerFP].
					"And finally follow the caller context."
					self assert: theFP = thePage baseFP.
					oop := self frameCallerContext: theFP.
					(objectMemory isForwarded: oop)
						ifTrue: [self
								frameCallerContext: theFP
								put: (objectMemory followForwarded: oop)]]]