composition
fixLastWithHeight: lineHeightGuess 
	"This awful bit is to ensure that if we have scanned all the text and the
	last character is a CR that there is a null line at the end of lines.
	Sometimes this was not happening which caused anomalous
	selections when selecting all the text. This is implemented as a
	post-composition fixup because I coul;dn't figure out where to put it
	in the main logic."
	| _gsSqueakTemp_oldLastLine _gsSqueakTemp_newRectangle _gsSqueakTemp_line |
	(text size > 1
			and: [text last = Character cr])
		ifFalse: [^ self].
	_gsSqueakTemp_oldLastLine := lines last.
	_gsSqueakTemp_oldLastLine last - _gsSqueakTemp_oldLastLine first >= 0
		ifFalse: [^ self].
	_gsSqueakTemp_oldLastLine last = text size
		ifFalse: [^ self].
	_gsSqueakTemp_newRectangle := _gsSqueakTemp_oldLastLine left @ _gsSqueakTemp_oldLastLine bottom extent: 0 @ (_gsSqueakTemp_oldLastLine bottom - _gsSqueakTemp_oldLastLine top).
	"Even though we may be below the bottom of the container,
	it is still necessary to compose the last line for consistency..."
	_gsSqueakTemp_line := TextLine
				start: text size + 1
				stop: text size
				internalSpaces: 0
				paddingWidth: 0.
	_gsSqueakTemp_line rectangle: _gsSqueakTemp_newRectangle.
	_gsSqueakTemp_line lineHeight: lineHeightGuess baseline: textStyle baseline.
	lines := lines
				, (Array with: _gsSqueakTemp_line)