slot getters/setters
setCostume: aForm 
	"Set the receiver's graphic as indicated. An earlier wording, disused
	but may persist in preexisting scripts."
	| _gsSqueakTemp_aMorph |
	^ (_gsSqueakTemp_aMorph := costume renderedMorph) isSketchMorph
		ifTrue: [_gsSqueakTemp_aMorph form: aForm]