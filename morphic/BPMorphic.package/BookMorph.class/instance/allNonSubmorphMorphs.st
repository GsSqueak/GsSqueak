submorphs-accessing
allNonSubmorphMorphs
	"Return a collection containing all morphs in this morph which are not
	currently in the submorph containment hierarchy. Especially the
	non-showing pages in BookMorphs. (As needed, make a variant of this
	that brings in all pages that are not in memory.)"
	| _gsSqueakTemp_coll |
	_gsSqueakTemp_coll := OrderedCollection new.
	pages
		do: [:pg | pg isInMemory
				ifTrue: [pg == currentPage
						ifFalse: [_gsSqueakTemp_coll add: pg]]].
	^ _gsSqueakTemp_coll