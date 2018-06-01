slots-user
chooseSlotTypeFor: aGetter 
	"Let the user designate a type for the slot associated with the given
	getter "
	| _gsSqueakTemp_typeChoices _gsSqueakTemp_typeChosen _gsSqueakTemp_slotName |
	_gsSqueakTemp_slotName := aGetter inherentSelector.
	_gsSqueakTemp_typeChoices := Vocabulary typeChoices.
	_gsSqueakTemp_typeChosen := UIManager default
				chooseFrom: (_gsSqueakTemp_typeChoices
						collect: [:t | t translated])
				values: _gsSqueakTemp_typeChoices
				title: 'Choose the TYPE
for ' translated , _gsSqueakTemp_slotName , '
(currently ' translated , (self slotInfoAt: _gsSqueakTemp_slotName) type translated , ')'.
	_gsSqueakTemp_typeChosen isEmptyOrNil
		ifTrue: [^ self].
	(self typeForSlot: _gsSqueakTemp_slotName) capitalized = _gsSqueakTemp_typeChosen
		ifTrue: [^ self].
	(self slotInfoAt: _gsSqueakTemp_slotName)
		type: _gsSqueakTemp_typeChosen.
	self class
		allInstancesDo: [:anInst | "allSubInstancesDo:"
			anInst
				instVarNamed: _gsSqueakTemp_slotName asString
				put: (anInst
						valueOfType: _gsSqueakTemp_typeChosen
						from: (anInst instVarNamed: _gsSqueakTemp_slotName))].
	self updateAllViewers.
	"does siblings too"
	self changeTypesInWatchersOf: _gsSqueakTemp_slotName
	"does siblings too"