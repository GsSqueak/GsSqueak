*Morphic-Balloon
chooseNewGraphicIn: aMorph event: evt 
	"Used by any morph that can be represented by a graphic"
	| aGraphicalMenu |
	aGraphicalMenu := GraphicalMenu new
				initializeFor: self
				withForms: aMorph reasonableBitmapFillForms
				coexist: true.
	aGraphicalMenu selector: #newForm:forMorph:;
		 argument: aMorph.
	evt hand attachMorph: aGraphicalMenu