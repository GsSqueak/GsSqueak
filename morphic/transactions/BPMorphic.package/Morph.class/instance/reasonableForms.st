menus
reasonableForms
	"Answer an OrderedCollection of forms that could be used to replace
	my form, with my current form first."
	| reasonableForms myGraphic |
	reasonableForms := self class allSketchMorphForms.
	reasonableForms addAll: Imports default images.
	reasonableForms
		remove: (myGraphic := self form)
		ifAbsent: [].
	reasonableForms := reasonableForms asOrderedCollection.
	reasonableForms addFirst: myGraphic.
	^ reasonableForms