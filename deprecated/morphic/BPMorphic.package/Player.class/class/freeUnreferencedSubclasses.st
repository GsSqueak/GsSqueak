housekeeping
freeUnreferencedSubclasses
	"Player classes may hold in their class instance variables references
	to instances of themselves that are housekeepingwise unreachable.
	This method allows such loops to be garbage collected. This is done in
	three steps:
	1. Remove user-created subclasses from the 'subclasses' set and from
	Smalltalk. Only remove classes whose name begins with 'Player' and
	which have no references.
	2. Do a full garbage collection.
	3. Enumerate all Metaclasses and find those whose soleInstance's
	superclass is this class. Reset the subclasses set to this set of
	classes, and add back to Smalltalk."
	"Player freeUnreferencedSubclasses"
	| _gsSqueakTemp_oldFree _gsSqueakTemp_candidatesForRemoval _gsSqueakTemp_class |
	_gsSqueakTemp_oldFree := Smalltalk garbageCollect.
	_gsSqueakTemp_candidatesForRemoval := self subclasses asOrderedCollection
				select: [:aClass | (aClass name beginsWith: 'Player')
						and: [aClass name endsWithDigit]].
	"Break all system links and then perform garbage collection."
	_gsSqueakTemp_candidatesForRemoval
		do: [:c | 
			self removeSubclass: c.
			"Break downward subclass pointers."
			c environment
				removeKey: c name
				ifAbsent: []].
	_gsSqueakTemp_candidatesForRemoval := nil.
	Smalltalk garbageCollect.
	"Now this should reclaim all unused
	subclasses"
	"Now reconstruct system links to subclasses with valid references."
	"First restore any global references via associations"
	(Association allSubInstances
		select: [:assn | assn key isSymbol
				and: [(assn key beginsWith: 'Player')
						and: [assn key endsWithDigit]]])
		do: [:assn | 
			_gsSqueakTemp_class := assn value.
			(_gsSqueakTemp_class isKindOf: self class)
				ifTrue: [self addSubclass: _gsSqueakTemp_class.
					_gsSqueakTemp_class environment add: assn]].
	"Then restore any further direct references, creating new
	associations."
	(Metaclass allInstances
		select: [:m | (m soleInstance name beginsWith: 'Player')
				and: [m soleInstance name endsWithDigit]])
		do: [:m | 
			_gsSqueakTemp_class := m soleInstance.
			((_gsSqueakTemp_class isKindOf: self class)
					and: [(_gsSqueakTemp_class environment includesKey: _gsSqueakTemp_class name) not])
				ifTrue: [self addSubclass: _gsSqueakTemp_class.
					_gsSqueakTemp_class environment at: _gsSqueakTemp_class name put: _gsSqueakTemp_class]].
	SystemOrganization removeMissingClasses.
	^ Smalltalk garbageCollect - _gsSqueakTemp_oldFree