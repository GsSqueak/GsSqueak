process primitives
primitiveExitCriticalSection
	"Exit the critical section.
	This may change the active process as a result."
	| _gsSqueakTemp_criticalSection _gsSqueakTemp_owningProcessIndex _gsSqueakTemp_owningProcess |
	_gsSqueakTemp_criticalSection := self stackTop.
	"rcvr"
	_gsSqueakTemp_owningProcessIndex := ExcessSignalsIndex.
	"CriticalSections are laid out like Semaphores"
	(self isEmptyList: _gsSqueakTemp_criticalSection)
		ifTrue: [objectMemory
				storePointerUnchecked: _gsSqueakTemp_owningProcessIndex
				ofObject: _gsSqueakTemp_criticalSection
				withValue: objectMemory nilObject]
		ifFalse: [_gsSqueakTemp_owningProcess := self removeFirstLinkOfList: _gsSqueakTemp_criticalSection.
			"store check unnecessary because criticalSection referred to
			owningProcess via its FirstLinkIndex slot before owningProcess
			was removed."
			objectMemory
				storePointerUnchecked: _gsSqueakTemp_owningProcessIndex
				ofObject: _gsSqueakTemp_criticalSection
				withValue: _gsSqueakTemp_owningProcess.
			"Note that resume: isn't fair; it won't suspend the active
			process. For fairness we must do the equivalent of a
			primitiveYield, but that
			may break old code, so we stick with unfair resume:."
			self resume: _gsSqueakTemp_owningProcess preemptedYieldingIf: preemptionYields]