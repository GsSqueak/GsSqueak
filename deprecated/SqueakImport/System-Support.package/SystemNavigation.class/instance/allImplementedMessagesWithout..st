query
allImplementedMessagesWithout: behaviorsAndSelectorsPair 
	"Answer a set of all the selectors that are implemented in the system, computed in the absence of the supplied behaviors and selectors."
	
	| selectors behaviorsToReject |
	selectors := IdentitySet new.
	behaviorsToReject := behaviorsAndSelectorsPair first asIdentitySet.
	self environment allClassesAndTraitsDo: [ :behavior |
		(behaviorsToReject includes: behavior name) ifFalse: [
			selectors
				addAll: behavior selectors;
				addAll: behavior classSide selectors ] ].
	behaviorsAndSelectorsPair second do: [ :each |
		selectors remove: each ].
	^selectors