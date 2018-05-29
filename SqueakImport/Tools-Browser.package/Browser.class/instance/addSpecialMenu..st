traits
addSpecialMenu: aMenu
	aMenu addList: #(
		-
		('new class'				newClass)
		('new trait'				newTrait)
		-).
	self selectedClass notNil ifTrue: [
		aMenu addList: #(
			('add trait' addTrait)
			-) ].
	aMenu addList: #(-).
	^ aMenu