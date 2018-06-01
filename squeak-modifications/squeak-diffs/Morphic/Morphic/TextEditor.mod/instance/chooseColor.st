editing keys
chooseColor
	"Make a new Text Color Attribute, let the user pick a color, and return the attribute"
	| attribute |
	attribute := TextColor color: Color black.
	NewColorPickerMorph useIt
		ifTrue:
			[ (NewColorPickerMorph on: attribute) openNear: morph fullBoundsInWorld ]
		ifFalse:
			[ ColorPickerMorph new
				 choseModalityFromPreference ;
				 sourceHand: morph activeHand ;
				 target: attribute ;
				 selector: #color: ;
				 originalColor: Color black ;
				
				putUpFor: morph
				near: morph fullBoundsInWorld ].
	^ attribute