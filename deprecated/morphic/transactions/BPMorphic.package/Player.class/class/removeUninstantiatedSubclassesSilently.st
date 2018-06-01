housekeeping
removeUninstantiatedSubclassesSilently
	"Remove the classes of any subclasses that have neither instances nor
	subclasses. Answer the number of bytes reclaimed"
	"Player removeUninstantiatedSubclassesSilently"
	| _gsSqueakTemp_oldFree |
	_gsSqueakTemp_oldFree := Smalltalk garbageCollect.
	self allSubclasses
		select: [:c | (c isSystemDefined not
					and: [c instanceCount = 0])
				and: [c subclasses isEmpty]]
		thenDo: [:c | c removeFromSystemUnlogged].
	^ Smalltalk garbageCollect - _gsSqueakTemp_oldFree