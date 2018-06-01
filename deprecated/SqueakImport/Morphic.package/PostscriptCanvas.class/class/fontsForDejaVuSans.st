font mapping
fontsForDejaVuSans

	| d |

	"Bold = 1, Ital = 2, Under = 4, Narrow = 8, Struckout = 16"
	d := Dictionary new.
	d
		at: 0 put: #('Helvetica-Bold' 1.0);
		at: 1 put: #('Helvetica-Bold' 1.0);
		at: 2 put: #('Helvetica-Oblique' 1.0);
		at: 3 put: #('Helvetica-BoldOblique' 1.0).
	^d