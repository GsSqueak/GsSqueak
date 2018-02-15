editing
setFontStyle
	| _gsSqueakTemp_aList _gsSqueakTemp_reply _gsSqueakTemp_style |
	_gsSqueakTemp_aList := (TextConstants
				select: [:anItem | anItem isKindOf: TextStyle]) keys asArray.
	_gsSqueakTemp_reply := UIManager default chooseFrom: _gsSqueakTemp_aList values: _gsSqueakTemp_aList.
	_gsSqueakTemp_reply notNil
		ifTrue: [(_gsSqueakTemp_style := TextStyle named: _gsSqueakTemp_reply)
				ifNil: [Beeper beep.
					^ true].
			self font: _gsSqueakTemp_style defaultFont]