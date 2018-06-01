private
setFont
	"Set the font and other emphasis."
	| _gsSqueakTemp_priorFont |
	_gsSqueakTemp_priorFont := font.
	text
		ifNotNil: [emphasisCode := 0.
			kern := 0.
			indentationLevel := 0.
			alignment := textStyle alignment.
			font := nil.
			(text attributesAt: lastIndex forStyle: textStyle)
				do: [:att | att emphasizeScanner: self]].
	font
		ifNil: [self setFont: textStyle defaultFontIndex].
	self
		setActualFont: (font emphasized: emphasisCode).
	_gsSqueakTemp_priorFont
		ifNotNil: [font = _gsSqueakTemp_priorFont
				ifTrue: ["font is the same, perhaps the color has changed?
					We still want kerning between chars of the same
					font, but of different color. So add any pending kern
					to destX"
					destX := destX
								+ (pendingKernX
										ifNil: [0])].
			destX := destX + _gsSqueakTemp_priorFont descentKern].
	pendingKernX := 0.
	"clear any pending kern so there is no danger of it being added twice"
	destX := destX - font descentKern.
	"NOTE: next statement should be removed when clipping works"
	leftMargin
		ifNotNil: [destX := destX max: leftMargin].
	kern := kern - font baseKern.
	"Install various parameters from the font."
	spaceWidth := font widthOf: Space