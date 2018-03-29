debug support
couldBeProcess: oop 
	^ (objectMemory addressCouldBeObj: oop)
		and: [(objectMemory isPointersNonImm: oop)
				and: [(objectMemory isContext: oop) not
						and: [(objectMemory lengthOf: oop)
									> MyListIndex
								and: [objectMemory
										isContext: (objectMemory fetchPointer: SuspendedContextIndex ofObject: oop)]]]]