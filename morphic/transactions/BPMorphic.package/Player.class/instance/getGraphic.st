slot getters/setters
getGraphic
	"Answer a form representing the receiver's primary graphic"
	| _gsSqueakTemp_aMorph |
	^ (_gsSqueakTemp_aMorph := costume renderedMorph) isSketchMorph
		ifTrue: [_gsSqueakTemp_aMorph form]
		ifFalse: [_gsSqueakTemp_aMorph isPlayfieldLike
				ifTrue: [_gsSqueakTemp_aMorph backgroundForm]
				ifFalse: [_gsSqueakTemp_aMorph imageForm]]