slot getters/setters
getRadialGradientFill
	"Geter for costume's useGradientFill"
	| _gsSqueakTemp_aStyle |
	^ (_gsSqueakTemp_aStyle := costume renderedMorph fillStyle) isGradientFill
		and: [_gsSqueakTemp_aStyle isRadialFill]