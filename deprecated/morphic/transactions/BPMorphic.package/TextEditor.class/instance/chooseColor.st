editing keys
chooseColor
	"Make a new Text Color Attribute, let the user pick a color, and return
	the attribute"
	| _gsSqueakTemp_attribute |
	_gsSqueakTemp_attribute := TextColor color: Color black.
	NewColorPickerMorph useIt
		ifTrue: [(NewColorPickerMorph on: _gsSqueakTemp_attribute)
				openNear: morph fullBoundsInWorld]
		ifFalse: [ColorPickerMorph new choseModalityFromPreference; sourceHand: morph activeHand; target: _gsSqueakTemp_attribute; selector: #color:; originalColor: Color black; putUpFor: morph near: morph fullBoundsInWorld].
	^ _gsSqueakTemp_attribute