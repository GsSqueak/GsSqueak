image save/restore
snapshot: embedded 
	"update state of active context"
	| activeProc dataSize rcvr setMacType |
	<var: #setMacType type: 'void *'>
	compilerInitialized
		ifTrue: [self compilerPreSnapshot]
		ifFalse: [self storeContextRegisters: activeContext].

	"update state of active process"
	activeProc := objectMemory fetchPointer: ActiveProcessIndex ofObject: self schedulerPointer.
	objectMemory
		storePointer: SuspendedContextIndex
		ofObject: activeProc
		withValue: activeContext.

	"compact memory and compute the size of the memory actually in use"
	objectMemory incrementalGC.

	"maximimize space for forwarding table"
	objectMemory fullGC.
	self snapshotCleanUp.

	dataSize := objectMemory getFreeBlock - objectMemory startOfMemory. "Assume all objects are below the start of the free block"
	self successful
		ifTrue: [rcvr := self popStack.
			"pop rcvr"
			self push: objectMemory getTrueObj.
			self writeImageFile: dataSize.
			embedded
				ifFalse: ["set Mac file type and creator; this is a noop on other platforms"
					setMacType := self ioLoadFunction: 'setMacFileTypeAndCreator' From: 'FilePlugin'.
					setMacType = 0
						ifFalse: [self cCode: '((sqInt (*)(char *, char *, char *))setMacType)(imageName, "STim", "FAST")']].
			self pop: 1].

	"activeContext was unmarked in #snapshotCleanUp, mark it old "
	objectMemory beRootIfOld: activeContext.
	self successful
		ifTrue: [self push: objectMemory getFalseObj]
		ifFalse: [self push: rcvr].
	compilerInitialized
		ifTrue: [self compilerPostSnapshot]