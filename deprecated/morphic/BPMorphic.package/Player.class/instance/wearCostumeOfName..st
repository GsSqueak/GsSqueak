costume
wearCostumeOfName: aName 
	| _gsSqueakTemp_classToUse |
	_gsSqueakTemp_classToUse := Smalltalk
				at: (aName , 'Morph') asSymbol
				ifAbsent: [Smalltalk at: aName asSymbol].
	self wearCostumeOfClass: _gsSqueakTemp_classToUse