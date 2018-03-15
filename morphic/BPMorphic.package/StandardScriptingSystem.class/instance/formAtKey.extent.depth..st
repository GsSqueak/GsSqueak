form dictionary
formAtKey: aKey extent: extent depth: depth 
	"ScriptingSystem saveForm: (TileMorph downPicture) atKey:
	'downArrow' "
	^ FormDictionary
		at: aKey asSymbol
		ifAbsent: [Form extent: extent depth: depth]