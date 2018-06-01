font mapping
fontsForNewYork

	| d |

	"Bold = 1, Ital = 2, Under = 4, Narrow = 8, Struckout = 16"
	d := Dictionary new.
	d
		at: 0 put: #('Times-Roman' 1.0);
		at: 1 put: #('Times-Bold' 1.0);
		at: 2 put: #('Times-Italic' 1.0);
		at: 3 put: #('Times-BoldItalic' 1.0);
		at: 8 put: #('Helvetica-Narrow' 1.0);
		at: 9 put: #('Helvetica-Narrow-Bold' 1.0);
		at: 10 put: #('Helvetica-Narrow-Oblique' 1.0);
		at: 11 put: #('Helvetica-Narrow-BoldOblique' 1.0).
	^d