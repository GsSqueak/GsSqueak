accessing
typographicDescender
	"Microsoft defines this as the 'true typographic metrics' of the font."
	^ sTypoDescender
		ifNil: [descender]