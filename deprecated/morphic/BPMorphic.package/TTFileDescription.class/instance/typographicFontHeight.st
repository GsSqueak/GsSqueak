accessing
typographicFontHeight
	"cope for the fact that typographicAscender and 
	typographicDescender may not be available and 
	0-height fonts are a bit useless"
	| _gsSqueakTemp_tfh |
	_gsSqueakTemp_tfh := self typographicAscender - self typographicDescender.
	^ _gsSqueakTemp_tfh = 0
		ifTrue: [self fontHeight]
		ifFalse: [_gsSqueakTemp_tfh]