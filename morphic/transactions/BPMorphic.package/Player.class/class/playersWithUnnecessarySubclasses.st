housekeeping
playersWithUnnecessarySubclasses
	"Return a list of all players whose scripts dictionaries contain entries
	with nil selectors"
	"Player playersWithUnnecessarySubclasses size"
	^ self withAllSubclasses
		select: [:p | p class isSystemDefined not
				and: [p scripts size = 0
						and: [p instVarNames size = 0]]]