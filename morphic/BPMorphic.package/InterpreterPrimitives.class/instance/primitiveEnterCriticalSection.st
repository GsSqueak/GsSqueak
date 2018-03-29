process primitives
primitiveEnterCriticalSection
	"Attempt to enter a CriticalSection/Mutex. If not owned, set the owner
	to the current
	process and answer false. If owned by the current process answer
	true. Otherwise
	suspend the process. Answer if the receiver is owned by the current
	process. For simulation if there is an argument it is taken to be the
	effective activeProcess
	(see Process>>effectiveProcess)."
	| _gsSqueakTemp_criticalSection _gsSqueakTemp_owningProcessIndex _gsSqueakTemp_owningProcess _gsSqueakTemp_activeProc |
	argumentCount > 0
		ifTrue: [_gsSqueakTemp_criticalSection := self stackValue: 1.
			"rcvr"
			_gsSqueakTemp_activeProc := self stackTop]
		ifFalse: [_gsSqueakTemp_criticalSection := self stackTop.
			"rcvr"
			_gsSqueakTemp_activeProc := self activeProcess].
	_gsSqueakTemp_owningProcessIndex := ExcessSignalsIndex.
	"CriticalSections are laid out like Semaphores"
	_gsSqueakTemp_owningProcess := objectMemory fetchPointer: _gsSqueakTemp_owningProcessIndex ofObject: _gsSqueakTemp_criticalSection.
	_gsSqueakTemp_owningProcess = objectMemory nilObject
		ifTrue: [objectMemory
				storePointer: _gsSqueakTemp_owningProcessIndex
				ofObject: _gsSqueakTemp_criticalSection
				withValue: _gsSqueakTemp_activeProc.
			^ self pop: argumentCount + 1 thenPush: objectMemory falseObject].
	_gsSqueakTemp_owningProcess = _gsSqueakTemp_activeProc
		ifTrue: [^ self pop: argumentCount + 1 thenPush: objectMemory trueObject].
	"Arrange to answer false (unowned) when the process is resumed."
	self pop: argumentCount + 1 thenPush: objectMemory falseObject.
	self addLastLink: _gsSqueakTemp_activeProc toList: _gsSqueakTemp_criticalSection.
	self transferTo: self wakeHighestPriority