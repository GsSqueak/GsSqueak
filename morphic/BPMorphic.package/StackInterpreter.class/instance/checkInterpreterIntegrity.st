object memory support
checkInterpreterIntegrity
	"Perform an integrity/leak check using the heapMap. Assume
	clearLeakMapAndMapAccessibleObjects has set a bit at each
	object's header. Check that all oops in the interpreter's state
	points to a header. Answer 0 if all checks pass."
	| _gsSqueakTemp_flags |
	_gsSqueakTemp_flags := 0.
	(objectMemory checkOopIntegrity: objectMemory specialObjectsOop named: 'specialObjectsOop')
		ifFalse: [_gsSqueakTemp_flags := 1].
	"No longer check messageSelector; it is ephemeral, not living beyond
	message lookup.
	(objectMemory isNonImmediate: messageSelector) ifTrue:
	[(objectMemory checkOopIntegrity: messageSelector named:
	'messageSelector') ifFalse:
	[flags := flags + N]]."
	(objectMemory checkOopIntegrity: newMethod named: 'newMethod')
		ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 2].
	"No longer check lkupClass; it is ephemeral, not living beyond message
	lookup. (objectMemory checkOopIntegrity: lkupClass named:
	'lkupClass') ifFalse:
	[flags := flags + N]."
	(objectMemory checkOopIntegrity: profileProcess named: 'profileProcess')
		ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 4].
	(objectMemory checkOopIntegrity: profileMethod named: 'profileMethod')
		ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 8].
	(objectMemory checkOopIntegrity: profileSemaphore named: 'profileSemaphore')
		ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 16].
	tempOop = 0
		ifFalse: [(objectMemory checkOopIntegrity: tempOop named: 'tempOop')
				ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 32]].
	tempOop2 = 0
		ifFalse: [(objectMemory checkOopIntegrity: tempOop2 named: 'tempOop2')
				ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 64]].
	"Callback support - check suspended callback list"
	1
		to: jmpDepth
		do: [:i | 
			(objectMemory
					checkOopIntegrity: (suspendedCallbacks at: i)
					named: 'suspendedCallbacks'
					index: i)
				ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 128].
			(objectMemory
					checkOopIntegrity: (suspendedMethods at: i)
					named: 'suspendedMethods'
					index: i)
				ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 256]].
	self checkLogIntegrity
		ifFalse: [_gsSqueakTemp_flags := _gsSqueakTemp_flags + 512].
	^ _gsSqueakTemp_flags