menus
chooseNewGraphicCoexisting: aBoolean 
	"Allow the user to choose a different form for her form-based morph"

	| replacee aGraphicalMenu |
	self isInWorld ifFalse: "menu must have persisted for a not-in-world object."
		[aGraphicalMenu := ActiveWorld submorphThat:
				[:m | (m isKindOf: GraphicalMenu) and: [m target == self]]
			 ifNone:
				[^ self].
		^ aGraphicalMenu show; flashBounds].
	aGraphicalMenu := GraphicalMenu new
				initializeFor: self
				withForms: self reasonableForms
				coexist: aBoolean.
	aBoolean
		ifTrue: [self primaryHand attachMorph: aGraphicalMenu]
		ifFalse: [replacee := self topRendererOrSelf.
			replacee owner replaceSubmorph: replacee by: aGraphicalMenu]