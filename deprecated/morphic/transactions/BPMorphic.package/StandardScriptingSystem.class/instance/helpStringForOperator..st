-Etoys-utilities
helpStringForOperator: anOperator 
	"Answer the help string associated with the given operator. If none
	found, return a standard no-help-available reply"
	^ (self helpStringOrNilForOperator: anOperator)
		ifNil: ['Sorry, no help available here' translated
			"This should never be seen, but is provided as a backstop"]