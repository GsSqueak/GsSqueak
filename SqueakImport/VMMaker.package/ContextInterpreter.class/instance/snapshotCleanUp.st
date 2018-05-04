image save/restore
snapshotCleanUp
	"Clean up right before saving an image, sweeping memory and:
	* nilling out all fields of contexts above the stack pointer. 
	* flushing external primitives 
	* clearing the root bit of any object in the root table "
	| oop header fmt sz |
	oop := objectMemory firstObject.
	[objectMemory oop: oop isLessThan: objectMemory getEndOfMemory]
		whileTrue: [(objectMemory isFreeObject: oop)
				ifFalse: [header := objectMemory longAt: oop.
					fmt := header >> 8 bitAnd: 15.
					"Clean out context"
					(fmt = 3 and: [self isContextHeader: header])
						ifTrue: [sz := objectMemory sizeBitsOf: oop.
							(objectMemory lastPointerOf: oop) + objectMemory bytesPerWord
								to: sz - objectMemory baseHeaderSize by: objectMemory bytesPerWord
								do: [:i | objectMemory longAt: oop + i put: objectMemory getNilObj]].
					"Clean out external functions"
					fmt >= 12
						ifTrue: ["This is a compiled method"
							(self primitiveIndexOf: oop) = PrimitiveExternalCallIndex
								ifTrue: ["It's primitiveExternalCall"
									self flushExternalPrimitiveOf: oop]]].
			oop := objectMemory objectAfter: oop].
	objectMemory clearRootsTable