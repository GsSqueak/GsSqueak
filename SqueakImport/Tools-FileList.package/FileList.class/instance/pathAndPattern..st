volume list and pattern
pathAndPattern: stringOrText
	"Answers both path and pattern"
	| base pat aString |
	aString := stringOrText asString.
	base := aString copyUpToLast: directory pathNameDelimiter.
	pat := aString copyAfterLast: directory pathNameDelimiter.
	self changed: #pathAndPattern. "avoid asking if it's okToChange"
	pattern := pat.
	self directory: (FileDirectory on: base).
	self changed: #pathAndPattern.
	self changed: #selectedPath.