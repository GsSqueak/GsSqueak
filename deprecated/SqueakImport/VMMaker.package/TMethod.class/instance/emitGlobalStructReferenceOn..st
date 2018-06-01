C code generation
emitGlobalStructReferenceOn: aStream
	"Add a reference to the globals struct if needed"

	(self globalStructureBuildMethodHasFoo > 1)
		ifTrue: [aStream nextPutAll: 'register struct foo * foo = &fum;'; cr].
