just like textMorph
contents
	| tm |
	"talk to my text"

	(tm := self findA: TextMorph) ifNil: [^ nil].
	^ tm contents