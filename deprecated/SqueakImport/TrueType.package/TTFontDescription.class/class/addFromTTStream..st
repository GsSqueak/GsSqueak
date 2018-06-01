instance creation
addFromTTStream: readStream
"
	self addFromTTFile: 'C:\WINDOWS\Fonts\ARIALN.TTF'
"

	| tt |
	tt := TTFontReader readFrom: readStream.
	tt := self addToDescription: tt.
	tt blankGlyphForSeparators.
	^ tt.
