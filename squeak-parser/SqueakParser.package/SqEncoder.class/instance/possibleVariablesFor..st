private
possibleVariablesFor: proposedVariable 
	| results |
	results := proposedVariable correctAgainstDictionary: scopeTable continuedFrom: nil.
	proposedVariable first canBeGlobalVarInitial
		ifTrue: [results := cue getClass possibleVariablesFor: proposedVariable continuedFrom: results].
	^ proposedVariable correctAgainst: nil continuedFrom: results