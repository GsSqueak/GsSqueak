writing
blockers: anIdentDict
	"maps objects -> nil if they should not be written.  object -> anotherObject if they need substitution."

	anIdentDict class == IdentityDictionary ifFalse: [self error: 'must be IdentityDictionary'].
	blockers := anIdentDict