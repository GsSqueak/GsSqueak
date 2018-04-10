slot getters/setters
getCostumeAtCursor
	"Answer the form representing the object at the current cursor. An
	earlier wording, disused but may persist in preexisting scripts"
	| _gsSqueakTemp_anObject _gsSqueakTemp_aMorph |
	_gsSqueakTemp_anObject := self getValueFromCostume: #valueAtCursor.
	^ _gsSqueakTemp_anObject == 0
		ifTrue: ["weird return from GraphMorph"
			ScriptingSystem formAtKey: #Paint]
		ifFalse: [(_gsSqueakTemp_aMorph := _gsSqueakTemp_anObject renderedMorph) isSketchMorph
				ifTrue: [_gsSqueakTemp_aMorph form]
				ifFalse: [_gsSqueakTemp_anObject imageForm]]