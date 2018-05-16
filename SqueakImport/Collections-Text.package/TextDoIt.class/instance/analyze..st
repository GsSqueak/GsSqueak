initialize-release
analyze: aString

	| list |
	list := super analyze: aString.
	evalString := (list at: 1) asString.
	^ list at: 2