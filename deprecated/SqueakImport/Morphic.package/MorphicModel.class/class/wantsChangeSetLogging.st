compiling
wantsChangeSetLogging
	"Log changes for MorphicModel itself and for things like PlayWithMe2, but not for automatically-created subclasses like MorphicModel1, MorphicModel2, etc."

	^ self == MorphicModel or:
		[(self class name beginsWith: 'Morphic') not]