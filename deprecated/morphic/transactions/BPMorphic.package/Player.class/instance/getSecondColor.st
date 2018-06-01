slot getters/setters
getSecondColor
	"Getter for costume's second color, if it's using gradient fill; sonst
	answers white."
	| _gsSqueakTemp_aFillStyle |
	^ (_gsSqueakTemp_aFillStyle := costume renderedMorph fillStyle) isGradientFill
		ifTrue: [_gsSqueakTemp_aFillStyle colorRamp last value]
		ifFalse: [Color white]