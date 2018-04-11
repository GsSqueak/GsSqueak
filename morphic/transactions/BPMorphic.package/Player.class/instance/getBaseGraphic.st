slot getters/setters
getBaseGraphic
	"Answer a form representing the receiver's base graphic"
	| _gsSqueakTemp_aMorph |
	^ (_gsSqueakTemp_aMorph := costume renderedMorph) isSketchMorph
		ifTrue: [_gsSqueakTemp_aMorph baseGraphic]
		ifFalse: [_gsSqueakTemp_aMorph imageForm]