menus
changeColor
	"Change the color of the receiver -- triggered, e.g. from a menu"
	NewColorPickerMorph useIt
		ifTrue: [(NewColorPickerMorph on: self)
				openNear: self fullBoundsInWorld]
		ifFalse: [ColorPickerMorph new choseModalityFromPreference; sourceHand: self activeHand; target: self; selector: #fillStyle:; originalColor: self color; putUpFor: self near: self fullBoundsInWorld]