class initialization
named: newName put: aColor
	"Add a new color to the list and create an access message and a class variable for it.  The name should start with a lowercase letter.  (The class variable will start with an uppercase letter.)  (Color colorNames) returns a list of all color names.  "
	| str cap sym accessor csym |
	(aColor isKindOf: self) ifFalse: [^ self error: 'not a Color'].
	str := newName asString.
	sym := str asSymbol.
	cap := str capitalized.
	csym := cap asSymbol.
	(self class canUnderstand: sym) ifFalse: [
		"define access message"
		accessor := str, (String with: Character cr with: Character tab), 			'^', cap.
		self class compile: accessor
			classified: 'named colors'].
	(self classPool includesKey: csym) ifFalse: [
		self addClassVarName: cap].
	ColorNames add: sym.
	^ self classPool at: csym put: aColor