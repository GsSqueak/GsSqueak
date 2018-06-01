just like textMorph
lineCount
	| tm |
	"how many lines in my text"

	(tm := self findA: TextMorph) ifNil: [^ nil].
	^ tm contents string lineCount