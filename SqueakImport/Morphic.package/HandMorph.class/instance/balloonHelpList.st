balloon help
balloonHelpList
	"Return all balloon morphs associated with this hand"

	^ self
		valueOfProperty: #balloonHelpMorphs
		ifAbsentPut: [OrderedCollection new]