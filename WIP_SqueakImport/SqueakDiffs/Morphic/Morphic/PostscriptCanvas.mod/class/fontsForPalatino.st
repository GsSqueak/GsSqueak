font mapping
fontsForPalatino

	| d |

	"Bold = 1, Ital = 2, Under = 4, Narrow = 8, Struckout = 16"
	d := Dictionary new.
	d
		at: 0 put: #('Palatino-Roman' 1.0);
		at: 1 put: #('Palatino-Bold' 1.0);
		at: 2 put: #('Palatino-Italic' 1.0);
		at: 3 put: #('Palatino-BoldItalic' 1.0).
	^d
