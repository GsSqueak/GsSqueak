slot getters/setters
setSecondColor: aColor 
	"Setter for costume's second color, if it's using gradient fill; if not, does
	nothing "
	| _gsSqueakTemp_aFillStyle _gsSqueakTemp_aMorph |
	^ (_gsSqueakTemp_aFillStyle := (_gsSqueakTemp_aMorph := costume renderedMorph) fillStyle) isGradientFill
		ifTrue: [_gsSqueakTemp_aFillStyle
				lastColor: aColor
				forMorph: _gsSqueakTemp_aMorph
				hand: ActiveHand]