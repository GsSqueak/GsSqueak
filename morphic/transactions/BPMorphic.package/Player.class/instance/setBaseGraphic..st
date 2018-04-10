slot getters/setters
setBaseGraphic: aGraphic 
	"Set the base graphic"
	| _gsSqueakTemp_aMorph |
	^ (_gsSqueakTemp_aMorph := costume renderedMorph) isSketchMorph
		ifTrue: [_gsSqueakTemp_aMorph baseGraphic: aGraphic]