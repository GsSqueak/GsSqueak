instance creation
newFromBDFFile: aFileName name: aString  "StrikeFont newFromBDFFile: 'helvR12.bdf' name: 'Helvetica12'"
	"Read a font from disk in the X11 Bitmap Distribution Format."

	| n |
	n := self new.
	n readBDFFromFile: aFileName name: aString.
	^n.

	"TextConstants at: #Helvetica put: (TextStyle fontArray: {StrikeFont newFromBDFFile: 'helvR12.bdf' name: 'Helvetica12'})"
	"TextConstants at: #Lucida put: (TextStyle fontArray: {StrikeFont newFromBDFFile: 'luRS12.bdf' name: 'Lucida'})"
	"TextStyle default fontAt: 5 put: (StrikeFont new readFromStrike2: 'helv12.sf2')."

