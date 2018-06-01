registry
removeStyleName: aString

	| style symName |
	symName := aString asSymbol.
	style := TextConstants removeKey: symName ifAbsent: [].
	style ifNotNil: [self unregister: symName].
	TTCFontDescription removeDescriptionNamed: aString asString.
