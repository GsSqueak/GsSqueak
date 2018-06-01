accessing
typographicFontHeight
	"cope for the fact that typographicAscender and 
	typographicDescender may not be available and 
	0-height fonts are a bit useless"
	| tfh |
	tfh := self typographicAscender - self typographicDescender.
	^ tfh = 0 ifTrue: [self fontHeight] ifFalse: [tfh]