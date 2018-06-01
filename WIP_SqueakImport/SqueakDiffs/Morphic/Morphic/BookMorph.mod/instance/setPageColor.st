menu
setPageColor
	"Get a color from the user, then set all the pages to that color"
	self currentPage ifNil: [ ^ self ].
	NewColorPickerMorph useIt
		ifTrue:
			[ (NewColorPickerMorph
				on: self
				originalColor: self currentPage color
				setColorSelector: #setAllPagesColor:) openNear: self fullBoundsInWorld ]
		ifFalse:
			[ ColorPickerMorph new
				 choseModalityFromPreference ;
				 sourceHand: self activeHand ;
				 target: self ;
				 selector: #setAllPagesColor: ;
				 originalColor: self currentPage color ;
				
				putUpFor: self
				near: self fullBoundsInWorld ]