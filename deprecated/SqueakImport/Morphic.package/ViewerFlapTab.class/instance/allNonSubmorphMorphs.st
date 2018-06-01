submorphs-accessing
allNonSubmorphMorphs
	"Return a collection containing all morphs in this morph which are not currently in the submorph containment hierarchy.  Especially the non-showing pages in BookMorphs."

	^ flapShowing 
		ifTrue: [#()]
		ifFalse: [Array with: referent]