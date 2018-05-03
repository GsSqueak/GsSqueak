debug support
objCouldBeClassObj: objOop
	"Answer if objOop looks like a class object.  WIth Spur be lenient if the object doesn't
	 yet have a hash (i.e. is not yet in the classTable), and accept forwarding pointers."
	<api>
	| fieldOop |
	self flag: #FIXME. "dtl - Reorganized to work around limitation in code generator, need oscog updates for code gen. Original oscog implementation is in class StackInterpreter."
	[objectMemory isPointersNonImm: objOop] ifTrue: [^ false].
	(objectMemory numSlotsOf: objOop) > InstanceSpecificationIndex
		ifTrue: [fieldOop := objectMemory fetchPointer: SuperclassIndex ofObject: objOop.
			((objectMemory addressCouldBeObj: fieldOop)
					and: [(objectMemory isPointersNonImm: fieldOop)
							or: [(objectMemory isOopForwarded: fieldOop)
									and: [objectMemory
											isPointers: (objectMemory followForwarded: fieldOop)]]])
				ifTrue: [fieldOop := objectMemory fetchPointer: MethodDictionaryIndex ofObject: objOop.
					^ (((objectMemory addressCouldBeObj: fieldOop)
								and: [(objectMemory isPointersNonImm: fieldOop)
										or: [(objectMemory isOopForwarded: fieldOop)
												and: [objectMemory
														isPointers: (objectMemory followForwarded: fieldOop)]]])
							and: [objectMemory
									isIntegerObject: (objectMemory fetchPointer: InstanceSpecificationIndex ofObject: objOop)])]].
	^ false