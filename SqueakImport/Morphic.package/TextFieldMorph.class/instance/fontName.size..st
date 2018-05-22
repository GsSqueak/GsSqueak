just like textMorph
fontName: fontName size: fontSize
	| tm |
	"talk to my text"

	(tm := self findA: TextMorph) ifNil: [^ nil].
	^ tm fontName: fontName size: fontSize
