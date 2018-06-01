debug printing
printAllStacks
	"Print all the stacks of all running processes, including those that are currently suspended."
	| oop proc ctx |
	<export: true> "exported to permit access from plugins"
	proc := objectMemory fetchPointer: ActiveProcessIndex ofObject: self schedulerPointer.
	self printNameOfClass: (objectMemory fetchClassOf: proc) count: 5.
	self cr.
	self printCallStackOf: activeContext. "first the active context"
	oop := objectMemory firstObject.
	[objectMemory oop: oop isLessThan: objectMemory getEndOfMemory] whileTrue:[
		(objectMemory fetchClassOf: oop) == objectMemory classSemaphore ifTrue:[
			self cr.
			proc := objectMemory fetchPointer: FirstLinkIndex ofObject: oop.
			[proc == objectMemory nilObject] whileFalse:[
				self printNameOfClass: (objectMemory fetchClassOf: proc) count: 5.
				self cr.
				ctx := objectMemory fetchPointer: SuspendedContextIndex ofObject: proc.
				ctx == objectMemory nilObject ifFalse:[self printCallStackOf: ctx].
				proc := objectMemory fetchPointer: NextLinkIndex ofObject: proc].
		].
		oop := objectMemory objectAfter: oop.
	].