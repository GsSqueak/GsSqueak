slot getters/setters
setRadialGradientFill: aBoolean 
	"Setter for costume's radialGradientFill"
	| _gsSqueakTemp_aStyle |
	(_gsSqueakTemp_aStyle := costume renderedMorph fillStyle) isGradientFill
		ifTrue: [_gsSqueakTemp_aStyle isRadialFill ~~ aBoolean
				ifTrue: [_gsSqueakTemp_aStyle radial: aBoolean.
					costume renderedMorph changed]]