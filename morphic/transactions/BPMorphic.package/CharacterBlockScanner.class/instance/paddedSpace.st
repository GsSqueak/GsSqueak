stop conditions
paddedSpace
	"When the line is justified, the spaces will not be the same as the font's
	space character. A padding of extra space must be considered in
	trying 
	to find which character the cursor is pointing at. Answer whether the 
	scanning has crossed the cursor."
	| _gsSqueakTemp_pad |
	spaceCount := spaceCount + 1.
	_gsSqueakTemp_pad := line justifiedPadFor: spaceCount font: font.
	lastCharacterWidth := spaceWidth + _gsSqueakTemp_pad.
	destX + lastCharacterWidth >= characterPoint x
		ifTrue: [^ self crossedX].
	lastIndex := lastIndex + 1.
	destX := destX + lastCharacterWidth + kern.
	pendingKernX := 0.
	^ false