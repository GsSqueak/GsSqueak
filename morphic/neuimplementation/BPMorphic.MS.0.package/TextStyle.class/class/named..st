constants
named: familyName 
	"Answer the TextStyle with the given name, or nil."
	"TextStyle named: 'NewYork'"
	| _gsSqueakTemp_textStyle |
	_gsSqueakTemp_textStyle := TextConstants
				at: familyName
				ifAbsent: [^ nil].
	(_gsSqueakTemp_textStyle isKindOf: self)
		ifFalse: [^ nil].
	^ _gsSqueakTemp_textStyle