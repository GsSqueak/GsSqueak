image save/restore
snapshot: embedded 
	"update state of active context"
	| _gsSqueakTemp_activeContext _gsSqueakTemp_activeProc _gsSqueakTemp_rcvr _gsSqueakTemp_setMacType _gsSqueakTemp_stackIndex |
	"For now the stack munging below doesn't deal with more than one
	argument. It can, and should."
	argumentCount ~= 0
		ifTrue: [^ self primitiveFailFor: PrimErrBadNumArgs].
	"Need to convert all frames into contexts since the snapshot file only
	holds objects."
	self push: instructionPointer.
	_gsSqueakTemp_activeContext := self voidVMStateForSnapshotFlushingExternalPrimitivesIf: true.
	"update state of active process"
	_gsSqueakTemp_activeProc := self activeProcess.
	objectMemory
		storePointer: SuspendedContextIndex
		ofObject: _gsSqueakTemp_activeProc
		withValue: _gsSqueakTemp_activeContext.
	tempOop := _gsSqueakTemp_activeContext.
	objectMemory garbageCollectForSnapshot.
	"Nothing moves from here on so it is safe to grab the activeContext
	again. "
	_gsSqueakTemp_activeContext := tempOop.
	tempOop := 0.
	self successful
		ifTrue: ["Without contexts or stacks simulate
			rcvr := self popStack. ''pop rcvr''
			self push: trueObj.
			to arrange that the snapshot resumes with true. N.B.
			stackIndex is one-relative."
			_gsSqueakTemp_stackIndex := self quickFetchInteger: StackPointerIndex ofObject: _gsSqueakTemp_activeContext.
			_gsSqueakTemp_rcvr := objectMemory fetchPointer: _gsSqueakTemp_stackIndex + CtxtTempFrameStart - 1 ofObject: _gsSqueakTemp_activeContext.
			objectMemory
				storePointerUnchecked: _gsSqueakTemp_stackIndex + CtxtTempFrameStart - 1
				ofObject: _gsSqueakTemp_activeContext
				withValue: objectMemory trueObject.
			"now attempt to write the snapshot file"
			self writeImageFileIO.
			(self successful
					and: [embedded not])
				ifTrue: ["set Mac file type and creator; this is a noop on other
					platforms "
					_gsSqueakTemp_setMacType := self ioLoadFunction: 'setMacFileTypeAndCreator' From: 'FilePlugin'.
					_gsSqueakTemp_setMacType = 0
						ifFalse: [self cCode: '((sqInt (*)(char *, char *, char *))setMacType)(imageName, "STim", "FAST")']].
			"Without contexts or stacks simulate
			self pop: 1"
			objectMemory
				storePointerUnchecked: StackPointerIndex
				ofObject: _gsSqueakTemp_activeContext
				withValue: (objectMemory integerObjectOf: _gsSqueakTemp_stackIndex - 1)].
	objectMemory postSnapshot.
	self marryContextInNewStackPageAndInitializeInterpreterRegisters: _gsSqueakTemp_activeContext.
	self successful
		ifTrue: [self push: objectMemory falseObject]
		ifFalse: [self push: _gsSqueakTemp_rcvr.
			self justActivateNewMethod]