menu
setWindowColor
	"Allow the user to select a new basic color for the window"
	NewColorPickerMorph useIt
		ifTrue:
			[ (NewColorPickerMorph
				on: self
				originalColor: self paneColorToUse
				setColorSelector: #setWindowColor:) openNear: self fullBounds ]
		ifFalse:
			[ ColorPickerMorph new
				 choseModalityFromPreference ;
				 sourceHand: self activeHand ;
				 target: self ;
				 selector: #setWindowColor: ;
				 originalColor: self paneColorToUse ;
				
				putUpFor: self
				near: self fullBounds ]