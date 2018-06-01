slot getters/setters
getCostume
	"Answer a form representing the receiver's primary graphic. An earlier
	wording, disused but may persist in preexisting scripts."
	| _gsSqueakTemp_aMorph |
	^ (_gsSqueakTemp_aMorph := costume renderedMorph) isSketchMorph
		ifTrue: [_gsSqueakTemp_aMorph form]
		ifFalse: [_gsSqueakTemp_aMorph imageForm]