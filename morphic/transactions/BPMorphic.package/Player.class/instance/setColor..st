slot getters/setters
setColor: aColor 
	"Set the color of the graphic as requested"
	| _gsSqueakTemp_aFillStyle _gsSqueakTemp_aMorph |
	(_gsSqueakTemp_aFillStyle := (_gsSqueakTemp_aMorph := self costume renderedMorph) fillStyle) isGradientFill
		ifTrue: [_gsSqueakTemp_aFillStyle
				firstColor: aColor
				forMorph: _gsSqueakTemp_aMorph
				hand: nil]
		ifFalse: [_gsSqueakTemp_aMorph color: aColor]