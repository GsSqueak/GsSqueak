slot getters/setters
getColor
	"Answer the color of my costume. If it uses a gradient fill, answer the
	first color."
	| _gsSqueakTemp_aFillStyle _gsSqueakTemp_aMorph |
	^ (_gsSqueakTemp_aFillStyle := (_gsSqueakTemp_aMorph := self costume renderedMorph) fillStyle) isGradientFill
		ifTrue: [_gsSqueakTemp_aFillStyle colorRamp first value]
		ifFalse: [_gsSqueakTemp_aMorph color]