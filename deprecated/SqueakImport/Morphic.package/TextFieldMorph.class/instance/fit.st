just like textMorph
fit
	"tell my text to recompute its looks"
	| tm |

	(tm := self findA: TextMorph) ifNil: [^ nil].
	tm releaseParagraph; paragraph.