menu
changeColor
	"Change the color of the receiver -- triggered, e.g. from a menu.  This variant allows the recolor triggered from the window's halo recolor handle to have the same result as choosing change-window-color from the window-title menu"
	NewColorPickerMorph useIt
		ifTrue:
			[ (NewColorPickerMorph
				on: self
				originalColor: self color
				setColorSelector: #setWindowColor:) openNear: self fullBoundsInWorld ]
		ifFalse:
			[ ColorPickerMorph new
				 choseModalityFromPreference ;
				 sourceHand: self activeHand ;
				 target: self ;
				 selector: #setWindowColor: ;
				 originalColor: self color ;
				
				putUpFor: self
				near: self fullBoundsInWorld ]