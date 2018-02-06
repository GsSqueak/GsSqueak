drop shadows
changeShadowColor
	"Change the shadow color of the receiver -- triggered, e.g. from a
	menu "
	NewColorPickerMorph useIt
		ifTrue: [(NewColorPickerMorph
				on: self
				originalColor: self shadowColor
				setColorSelector: #shadowColor:)
				openNearMorph: self]
		ifFalse: [ColorPickerMorph new choseModalityFromPreference; sourceHand: self activeHand; target: self; selector: #shadowColor:; originalColor: self shadowColor; putUpFor: self near: self fullBoundsInWorld]