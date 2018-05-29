font mapping
fontsForComicPlain

	| d |

	"Bold = 1, Ital = 2, Under = 4, Narrow = 8, Struckout = 16"

"how do we do underlined??"

	d := Dictionary new.
	d
		at: 0 put: #('Helvetica-Narrow' 0.9);
		at: 1 put: #('Helvetica-Narrow-Bold' 0.9);
		at: 2 put: #('Helvetica-Narrow-Oblique' 0.9);
		at: 3 put: #('Helvetica-Narrow-BoldOblique' 0.9).
	^d
