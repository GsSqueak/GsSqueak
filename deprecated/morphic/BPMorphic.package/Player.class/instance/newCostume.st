costume
newCostume
	| _gsSqueakTemp_reply |
	(_gsSqueakTemp_reply := UIManager default
				chooseFrom: self availableCostumeNames
				values: self availableCostumeNames
				title: 'choose a costume')
		ifNil: [^ self].
	self wearCostumeOfName: _gsSqueakTemp_reply.
	self updateAllViewers