accessing
frameHeight
	"Designed to avoid the entire frame computation (includes MVC form),
	since the menu may well end up being displayed in Morphic anyway."
	| nItems |
	frame ifNotNil: [^ frame height].
	nItems := 1 + (labelString occurrencesOf: Character cr).
	^ (nItems * MenuStyle lineGrid) + 4 "border width"