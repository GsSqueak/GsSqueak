object memory support
followForwardingPointersInScheduler
	| _gsSqueakTemp_schedAssoc _gsSqueakTemp_sched _gsSqueakTemp_procLists |
	_gsSqueakTemp_schedAssoc := objectMemory splObj: SchedulerAssociation.
	"the GC follows pointers in the special objects array for us."
	self assert: (objectMemory isForwarded: _gsSqueakTemp_schedAssoc) not.
	"Make sure the active process has been followed."
	objectMemory followForwardedObjectFields: _gsSqueakTemp_schedAssoc toDepth: 1.
	_gsSqueakTemp_sched := objectMemory fetchPointer: ValueIndex ofObject: _gsSqueakTemp_schedAssoc.
	_gsSqueakTemp_procLists := objectMemory followObjField: ProcessListsIndex ofObject: _gsSqueakTemp_sched.
	"Follow all links in the process list to ensure the lists are valid."
	0
		to: (objectMemory numSlotsOf: _gsSqueakTemp_procLists)
				- 1
		do: [:i | 
			| list first last next |
			list := objectMemory followObjField: i ofObject: _gsSqueakTemp_procLists.
			first := objectMemory followObjField: FirstLinkIndex ofObject: list.
			last := objectMemory followObjField: LastLinkIndex ofObject: list.
			[first ~= last]
				whileTrue: [next := objectMemory followObjField: NextLinkIndex ofObject: first.
					first := next]]