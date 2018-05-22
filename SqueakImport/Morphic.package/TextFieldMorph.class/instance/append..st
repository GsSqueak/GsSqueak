just like textMorph
append: stringOrText
	"add to my text"
	| tm |

	(tm := self findA: TextMorph) ifNil: [^ nil].
	tm contents append: stringOrText.
	tm releaseParagraph; paragraph.


	