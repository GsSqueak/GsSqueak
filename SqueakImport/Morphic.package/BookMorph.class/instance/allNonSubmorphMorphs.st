submorphs-accessing
allNonSubmorphMorphs
	"Return a collection containing all morphs in this morph which are not currently in the submorph containment hierarchy.  Especially the non-showing pages in BookMorphs.    (As needed, make a variant of this that brings in all pages that are not in memory.)"

	| coll |
	coll := OrderedCollection new.
	pages do: [:pg |
		pg isInMemory ifTrue: [
			pg == currentPage ifFalse: [coll add: pg]]].
	^ coll