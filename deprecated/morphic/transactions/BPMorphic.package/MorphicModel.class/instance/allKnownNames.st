submorphs-accessing
allKnownNames
	"Return a list of all known names based on the scope of the receiver. If
	the receiver is a member of a uniclass, incorporate the original 1997
	logic that queries the known names of the values of all the instance
	variables. "
	| _gsSqueakTemp_superNames |
	_gsSqueakTemp_superNames := super allKnownNames.
	"gather them from submorph tree"
	^ self belongsToUniClass
		ifTrue: [_gsSqueakTemp_superNames
				, (self instanceVariableValues
						select: [:e | e notNil
								and: [e knownName notNil]]
						thenCollect: [:e | e knownName])]
		ifFalse: [_gsSqueakTemp_superNames]