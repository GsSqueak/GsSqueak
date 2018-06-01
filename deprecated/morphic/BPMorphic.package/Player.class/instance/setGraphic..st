slot getters/setters
setGraphic: aForm 
	"Set the receiver's graphic as indicated"
	| _gsSqueakTemp_aMorph |
	^ (_gsSqueakTemp_aMorph := costume renderedMorph) isSketchMorph
		ifTrue: [_gsSqueakTemp_aMorph form: aForm]
		ifFalse: [_gsSqueakTemp_aMorph isPlayfieldLike
				ifTrue: [_gsSqueakTemp_aMorph backgroundForm: aForm]]