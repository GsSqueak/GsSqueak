debug support
objCouldBeClassObj: objOop 
	"Answer if objOop looks like a class object. WIth Spur be lenient if the
	object doesn't
	yet have a hash (i.e. is not yet in the classTable), and accept
	forwarding pointers."
	| _gsSqueakTemp_fieldOop |
	^ (objectMemory isPointersNonImm: objOop)
		and: [(objectMemory numSlotsOfAny: objOop)
					> InstanceSpecificationIndex
				and: [_gsSqueakTemp_fieldOop := objectMemory fetchPointer: SuperclassIndex ofObject: objOop.
					((objectMemory addressCouldBeObj: _gsSqueakTemp_fieldOop)
							and: [(objectMemory isPointersNonImm: _gsSqueakTemp_fieldOop)
									or: [(objectMemory isOopForwarded: _gsSqueakTemp_fieldOop)
											and: [objectMemory
													isPointers: (objectMemory followForwarded: _gsSqueakTemp_fieldOop)]]])
						and: [_gsSqueakTemp_fieldOop := objectMemory fetchPointer: MethodDictionaryIndex ofObject: objOop.
							((objectMemory addressCouldBeObj: _gsSqueakTemp_fieldOop)
									and: [(objectMemory isPointersNonImm: _gsSqueakTemp_fieldOop)
											or: [(objectMemory isOopForwarded: _gsSqueakTemp_fieldOop)
													and: [objectMemory
															isPointers: (objectMemory followForwarded: _gsSqueakTemp_fieldOop)]]])
								and: [objectMemory
										isIntegerObject: (objectMemory fetchPointer: InstanceSpecificationIndex ofObject: objOop)]]]]