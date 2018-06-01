other
removeStyleName: aString

	TextConstants removeKey: aString asSymbol ifAbsent: [].
	TTFontDescription removeDescriptionNamed: aString asString.
