slot getters/setters
getGraphicAtCursor
	"Answer the form representing the object at the current cursor"
	| _gsSqueakTemp_anObject _gsSqueakTemp_aMorph |
	_gsSqueakTemp_anObject := self getValueFromCostume: #valueAtCursor.
	^ _gsSqueakTemp_anObject == 0
		ifTrue: ["weird return from GraphMorph"
			ScriptingSystem formAtKey: #Paint]
		ifFalse: [(_gsSqueakTemp_aMorph := _gsSqueakTemp_anObject renderedMorph) isSketchMorph
				ifTrue: [_gsSqueakTemp_aMorph form]
				ifFalse: [_gsSqueakTemp_aMorph isPlayfieldLike
						ifTrue: [_gsSqueakTemp_aMorph backgroundForm]
						ifFalse: [_gsSqueakTemp_aMorph imageForm]]]