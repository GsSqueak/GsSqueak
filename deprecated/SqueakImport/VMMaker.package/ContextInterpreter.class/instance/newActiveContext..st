contexts
newActiveContext: aContext
	"Note: internalNewActiveContext: should track changes to this method."

	self storeContextRegisters: activeContext.
	(objectMemory oop: aContext isLessThan: objectMemory getYoungStart) ifTrue: [ objectMemory beRootIfOld: aContext ].
	activeContext := aContext.
	self fetchContextRegisters: aContext.