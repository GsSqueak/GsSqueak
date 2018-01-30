menus
chooseNewGraphicCoexisting: aBoolean 
	"Allow the user to choose a different form for her form-based morph"
	| replacee aGraphicalMenu |
	aGraphicalMenu := GraphicalMenu new
				initializeFor: self
				withForms: self reasonableForms
				coexist: aBoolean.
	aBoolean
		ifTrue: [self primaryHand attachMorph: aGraphicalMenu]
		ifFalse: [replacee := self topRendererOrSelf.
			replacee owner replaceSubmorph: replacee by: aGraphicalMenu]