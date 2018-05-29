user-interface
tabNamed: aName
	"Answer the tab of the given name, or nil if none"

	^ self tabMorphs detect: [:m | ((m isKindOf: StringMorph) and: [m contents = aName])
		or: [(m isKindOf: ReferenceMorph) and: [(m firstSubmorph isKindOf: StringMorph) and:
				[m firstSubmorph contents = aName]]]] ifNone: [nil]