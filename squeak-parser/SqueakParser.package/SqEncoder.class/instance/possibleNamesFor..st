private
possibleNamesFor: proposedName 
	| results |
	results := cue getClass possibleVariablesFor: proposedName continuedFrom: nil.
	^ proposedName correctAgainst: nil continuedFrom: results