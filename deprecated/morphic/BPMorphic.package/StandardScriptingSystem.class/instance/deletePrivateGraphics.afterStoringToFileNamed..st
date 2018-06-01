form dictionary
deletePrivateGraphics: nameList afterStoringToFileNamed: aFileName 
	"This method is used to strip private graphics from the FormDictionary
	and store them on a file of the given name"
	| _gsSqueakTemp_replacement _gsSqueakTemp_toRemove _gsSqueakTemp_aReferenceStream |
	_gsSqueakTemp_toRemove := Dictionary new.
	_gsSqueakTemp_replacement := FormDictionary at: #Gets.
	nameList
		do: [:aKey | 
			| keySymbol |
			keySymbol := aKey asSymbol.
			_gsSqueakTemp_toRemove
				at: keySymbol
				put: (self formAtKey: keySymbol).
			FormDictionary at: keySymbol put: _gsSqueakTemp_replacement].
	_gsSqueakTemp_aReferenceStream := ReferenceStream fileNamed: aFileName.
	_gsSqueakTemp_aReferenceStream nextPut: _gsSqueakTemp_toRemove.
	_gsSqueakTemp_aReferenceStream close