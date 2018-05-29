font mapping
fontMap
	"Answer the font mapping dictionary. Made into a class var so that it can be edited."
	^FontMap ifNil: [ self initializeFontMap. FontMap ].